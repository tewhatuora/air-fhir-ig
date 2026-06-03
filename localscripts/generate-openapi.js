#!/usr/bin/env node
/**
 * generate-openapi.js
 * ───────────────────────────────────────────────────────────────────────────
 * Generates an OpenAPI 3.0 specification from the AIR ImmSoT
 * capabilitystatement.fsh file.
 *
 * Usage:
 *   node generate-openapi.js [--input <path>] [--output <path>] [--format yaml|json]
 *
 * Defaults:
 *   --input   ./fsh/capabilitystatement.fsh
 *   --output  ./openapi/air-immsot-api.yaml
 *   --format  yaml
 *
 * Prerequisites:
 *   npm install js-yaml
 *
 * How it works:
 *   1. Parses the FSH CapabilityStatement using regex-based extraction
 *      (version, description, interactions, operations, search params).
 *   2. Builds a full OpenAPI 3.0.4 document from embedded templates plus
 *      the parsed FSH metadata.
 *   3. Writes the result as YAML (default) or JSON.
 *
 * Design principle:
 *   The FSH file is the single source of truth. Every time you update
 *   capabilitystatement.fsh and run this script, a fresh OpenAPI spec is
 *   produced without manual editing.
 * ───────────────────────────────────────────────────────────────────────────
 */

'use strict';

const fs   = require('fs');
const path = require('path');
const yaml = require('js-yaml');

// ─── CLI args ────────────────────────────────────────────────────────────────
const args = process.argv.slice(2);
function getArg(flag, def) {
  const i = args.indexOf(flag);
  return i !== -1 && args[i + 1] ? args[i + 1] : def;
}

const INPUT_FSH  = getArg('--input',  path.join(__dirname, 'fsh', 'capabilitystatement.fsh'));
const OUTPUT_FILE = getArg('--output', path.join(__dirname, 'openapi', 'air-immsot-api.yaml'));
const FORMAT      = getArg('--format', 'yaml');

// ─── Read FSH ────────────────────────────────────────────────────────────────
if (!fs.existsSync(INPUT_FSH)) {
  console.error(`ERROR: Input file not found: ${INPUT_FSH}`);
  process.exit(1);
}
const fsh = fs.readFileSync(INPUT_FSH, 'utf8');

// ─── FSH Parsing Helpers ─────────────────────────────────────────────────────
function extractValue(pattern, src) {
  const m = src.match(pattern);
  return m ? m[1].trim().replace(/^"|"$/g, '') : null;
}

function extractMultilineDoc(fieldPattern, src) {
  // Grabs the string after e.g. * rest.resource[=].interaction[=].documentation =
  // Handles triple-quoted FSH strings (""") and regular double-quoted strings.
  const idx = src.search(fieldPattern);
  if (idx === -1) return null;
  const after = src.slice(idx);
  const tripleMatch = after.match(/"""([\s\S]*?)"""/);
  if (tripleMatch) return tripleMatch[1].trim();
  const singleMatch = after.match(/"([^"\\]*(\\.[^"\\]*)*)"/);
  if (singleMatch) return singleMatch[1].replace(/\\n/g, '\n').replace(/\\"/g, '"').trim();
  return null;
}

// ─── Parse version from FSH ──────────────────────────────────────────────────
const version = extractValue(/\* version\s*=\s*"([^"]+)"/, fsh) || '2.1.0';
const csTitle  = extractValue(/\* title\s*=\s*"([^"]+)"/, fsh) || 'AIR ImmSoT API';

console.log(`Generating OpenAPI spec from: ${INPUT_FSH}`);
console.log(`  Version : ${version}`);
console.log(`  Title   : ${csTitle}`);

// ─── Parse operations from FSH ───────────────────────────────────────────────
// We collect operation names and their documentation blocks.
const operationDocs = {};
const opNameRe = /rest\.(?:resource\[.\]\.)?operation\[.\]\.name\s*=\s*"([^"]+)"/g;
let m;
while ((m = opNameRe.exec(fsh)) !== null) {
  const opName = m[1];
  // Find doc immediately after
  const after = fsh.slice(m.index);
  const docMatch = after.match(/operation\[.\]\.documentation\s*=\s*"""([\s\S]*?)"""/);
  if (docMatch) {
    operationDocs[opName] = docMatch[1].trim();
  }
}

// ─── Shared components ────────────────────────────────────────────────────────
const COMMON_HEADERS = {
  UserID: { $ref: '#/components/parameters/UserID' },
  'X-Correlation-ID': { $ref: '#/components/parameters/X-Correlation-ID' },
  FacilityID: { $ref: '#/components/parameters/FacilityID' },
  SourceSystemID: { $ref: '#/components/parameters/SourceSystemID' },
  'X-Api-Key': { $ref: '#/components/parameters/X-Api-Key' },
  APIVersion: { $ref: '#/components/parameters/APIVersion' },
};

function commonParams(includeUser = true, includeFacility = true) {
  const p = [];
  if (includeUser) p.push({ $ref: '#/components/parameters/UserID' });
  p.push({ $ref: '#/components/parameters/X-Correlation-ID' });
  if (includeFacility) p.push({ $ref: '#/components/parameters/FacilityID' });
  p.push({ $ref: '#/components/parameters/SourceSystemID' });
  p.push({ $ref: '#/components/parameters/X-Api-Key' });
  p.push({ $ref: '#/components/parameters/APIVersion' });
  return p;
}

const STD_ERRORS = {
  403: { $ref: '#/components/responses/403' },
  429: { $ref: '#/components/responses/429' },
  500: { $ref: '#/components/responses/500' },
};

// ─── Build OpenAPI document ───────────────────────────────────────────────────
const openapi = {
  openapi: '3.0.4',
  info: {
    title: 'AIR ImmSoT API',
    description: [
      'This API provides the ability to create, modify and retrieve Immunisation records',
      'from the AIR ImmSoT database. It also allows reading and updating consumer records.',
      '',
      '**API Versioning:**',
      '- Internal Health NZ consumers call `https://air.api.digital.health.nz/fhir/R4`.',
      '  Omit `APIVersion` header (or set `APIVersion=1`) for v1; set `APIVersion=2` for v2.',
      '- External consumers call `https://api.air.digital.health.nz/s2s/fhir/R4` (v1)',
      '  or `https://api.air.digital.health.nz/s2s/fhir/R4/v2` (v2).',
      '  Both external paths are gateway routes that forward to the internal `/fhir/R4` backend.',
      '',
      `Generated from \`capabilitystatement.fsh\` v${version}. Do not edit this file manually.`,
    ].join('\n'),
    version,
    contact: {
      name: 'Health New Zealand | Te Whatu Ora',
      url: 'https://www.tewhatuora.govt.nz/',
    },
    license: {
      name: 'Creative Commons Attribution 4.0 International',
      url: 'https://creativecommons.org/licenses/by/4.0/',
    },
  },

  servers: [
    {
      url: 'https://air.api.digital.health.nz',
      description: 'PROD – Internal Health NZ endpoint. /fhir/R4 with APIVersion omitted or =1 uses v1; APIVersion=2 uses v2.',
    },
    {
      url: 'https://api.air.digital.health.nz/s2s',
      description: 'PROD – External endpoint. /fhir/R4 → v1; /fhir/R4/v2 → v2.',
    },
    {
      url: 'https://air.api-uat.digital.health.nz',
      description: 'UAT – ImmSoT Service endpoint',
    },
    {
      url: 'https://air.api-sit.digital.health.nz',
      description: 'SIT – ImmSoT Service endpoint',
    },
    {
      url: 'https://air.api-dev.digital.health.nz',
      description: 'DEV – ImmSoT Service endpoint',
    },
  ],

  // ─── Paths ──────────────────────────────────────────────────────────────────
  paths: {

    // POST /fhir/R4/Immunization  (create)
    '/fhir/R4/Immunization': {
      post: {
        operationId: 'create',
        tags: ['Immunization'],
        summary: 'Create a new immunisation event',
        description: 'Creates a new immunisation event after validation. Returns the created Immunization record or an OperationOutcome on failure.',
        parameters: commonParams(),
        requestBody: {
          required: true,
          content: {
            'application/fhir+json': {
              schema: { $ref: '#/components/schemas/AirImmunization' },
            },
          },
        },
        responses: {
          201: { $ref: '#/components/responses/201' },
          422: { $ref: '#/components/responses/422' },
          ...STD_ERRORS,
        },
        security: [{ OAuth2: ['system/Immunization.c'] }],
      },
    },

    // GET/PUT /fhir/R4/Immunization/{ID}  (read + update)
    '/fhir/R4/Immunization/{ID}': {
      get: {
        operationId: 'read',
        tags: ['Immunization'],
        summary: 'Read an immunisation event by ID',
        description: 'Returns the immunisation event and enriched related resources (Patient, Organization, Practitioner, Location).',
        parameters: [
          { $ref: '#/components/parameters/ID' },
          ...commonParams(),
        ],
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': {
                schema: { $ref: '#/components/schemas/OrchestrationImmunizationBundle' },
              },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          404: { $ref: '#/components/responses/404' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/Immunization.r'] }],
      },

      put: {
        operationId: 'update',
        tags: ['Immunization'],
        summary: 'Update an existing immunisation event',
        description: operationDocs['update'] || 'Updates an existing immunisation event. Returns the updated record or an OperationOutcome.',
        parameters: [
          { $ref: '#/components/parameters/ID' },
          ...commonParams(),
          { $ref: '#/components/parameters/If-Match' },
        ],
        requestBody: {
          required: true,
          content: {
            'application/fhir+json': {
              schema: { $ref: '#/components/schemas/AirImmunization' },
            },
          },
        },
        responses: {
          200: { $ref: '#/components/responses/200' },
          400: { $ref: '#/components/responses/400' },
          401: { $ref: '#/components/responses/401' },
          403: { $ref: '#/components/responses/403' },
          422: { $ref: '#/components/responses/422' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [
          { OAuth2: ['system/Immunization.u'] },
          { OAuth2: ['air-admin/Immunization.u'] },
        ],
      },
    },

    // POST /fhir/R4/Immunization/_search
    '/fhir/R4/Immunization/_search': {
      post: {
        operationId: 'search',
        tags: ['Immunization'],
        summary: 'Search for immunisation events',
        description: [
          'Two search modes are available:',
          '',
          '**Standard NHI search** – POST with `application/x-www-form-urlencoded` body or query parameters.',
          'The `patient` parameter is required. Optional: `target-disease`, `status-reason:not-in`, `status:not-in`, `_include`.',
          '',
          '**Data-quality admin search** – Requires `_query=data-quality`, `_lastUpdated`, `_offset`, `_count`.',
          'Restricted to `air-admin/Immunization.s` scope.',
          '',
          'Do **not** send a JSON body for `_search`.',
        ].join('\n'),
        parameters: [
          ...commonParams(),
          {
            name: 'patient',
            in: 'query',
            required: false,
            description: 'NHI identifier or full Patient reference URL. E.g. `ZKN2155` or `https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKN2155`.',
            schema: { type: 'string' },
          },
          {
            name: '_query',
            in: 'query',
            description: 'Set to `data-quality` to invoke the admin data-quality search.',
            schema: { type: 'string', enum: ['data-quality'] },
          },
          {
            name: '_lastUpdated',
            in: 'query',
            description: 'Data-quality search only. Use `eq`, `ge`, or `le` prefix. E.g. `ge2023-05-11T00:25:20.641Z`.',
            schema: { type: 'string' },
          },
          {
            name: '_offset',
            in: 'query',
            description: 'Data-quality search only. Records to skip. Default: 0.',
            schema: { type: 'integer', minimum: 0, default: 0 },
          },
          {
            name: '_count',
            in: 'query',
            description: 'Data-quality search only. Records to return (1–100). Default: 100.',
            schema: { type: 'integer', minimum: 1, maximum: 100, default: 100 },
          },
          {
            name: '_includeMigratedData',
            in: 'query',
            description: 'Data-quality search only. Include migrated data. Default: `false`.',
            schema: { type: 'string', example: 'true' },
          },
          {
            name: '_include',
            in: 'query',
            description: 'Include related resources. Supported: `Patient`, `Immunization:performer`, `Immunization:location`.',
            schema: { type: 'string' },
            example: 'Patient',
          },
          {
            name: '_dqStatus',
            in: 'query',
            description: 'Data-quality search only. Filter by DQ status. Allowed: `I` (Identified), `A` (Accepted), `P` (Passed).',
            schema: { type: 'string', example: 'I,A' },
          },
          {
            name: 'target-disease',
            in: 'query',
            description: 'Standard search only. Filter by target disease (system|code). Comma-separated.',
            schema: { type: 'string' },
          },
          {
            name: 'status-reason:not-in',
            in: 'query',
            description: 'Standard search only. Exclude events with these status reasons (system|code or bare code). Comma-separated.',
            schema: { type: 'string' },
          },
          {
            name: 'status:not-in',
            in: 'query',
            description: 'Standard search only. Exclude events with these statuses. Allowed: `entered-in-error`, `completed`, `not-done`.',
            schema: { type: 'string' },
          },
          {
            name: 'status',
            in: 'query',
            description: 'Data-quality search only. Include only events with these statuses. Default: all.',
            schema: { type: 'string', example: 'entered-in-error,completed' },
          },
        ],
        requestBody: {
          required: false,
          description: 'Optional form body for NHI search parameters. Use `application/x-www-form-urlencoded` — do not send JSON.',
          content: {
            'application/x-www-form-urlencoded': {
              schema: { type: 'object' },
              example: { patient: 'ZZZ9999' },
            },
          },
        },
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': {
                schema: { $ref: '#/components/schemas/OrchestrationImmunizationBundle' },
              },
            },
          },
          400: { $ref: '#/components/responses/400' },
          401: { $ref: '#/components/responses/401' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [
          { OAuth2: ['system/Immunization.s'] },
          { OAuth2: ['air-admin/Immunization.s'] },
        ],
      },
    },

    // POST /fhir/R4/Immunization/{ID}/$match
    '/fhir/R4/Immunization/{ID}/$match': {
      post: {
        operationId: 'match',
        tags: ['Immunization'],
        summary: 'Manually match an immunisation event to a planned event',
        description: operationDocs['match'] || 'Manually matches an immunisation event to a planned event in the consumer\'s vaccination schedule.',
        parameters: [
          { $ref: '#/components/parameters/ID' },
          ...commonParams(),
        ],
        requestBody: {
          required: true,
          content: {
            'application/fhir+json': {
              schema: { $ref: '#/components/schemas/ManualMatching' },
            },
          },
        },
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': {
                schema: { $ref: '#/components/schemas/AirImmunizationBundle' },
              },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/Immunization.c', 'system/Immunization.u'] }],
      },
    },

    // POST /fhir/R4/Immunization/{ID}/$unmatch
    '/fhir/R4/Immunization/{ID}/$unmatch': {
      post: {
        operationId: 'unmatch',
        tags: ['Immunization'],
        summary: 'Manually unmatch an immunisation event from a planned event',
        description: operationDocs['unmatch'] || 'Manually unmatches a planned event.',
        parameters: [
          { $ref: '#/components/parameters/ID' },
          ...commonParams(),
        ],
        requestBody: {
          required: true,
          content: {
            'application/fhir+json': {
              schema: { $ref: '#/components/schemas/ManualMatching' },
            },
          },
        },
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': {
                schema: { $ref: '#/components/schemas/AirImmunizationBundle' },
              },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/Immunization.c', 'system/Immunization.u'] }],
      },
    },

    // GET /fhir/R4/Immunization/{ID}/_history
    '/fhir/R4/Immunization/{ID}/_history': {
      get: {
        operationId: 'history',
        tags: ['Immunization'],
        summary: 'Retrieve all versions of an immunisation event',
        description: 'Returns a FHIR history Bundle where each entry is a full Immunization snapshot including data-quality metadata.',
        parameters: [
          { $ref: '#/components/parameters/ID' },
          ...commonParams(),
        ],
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': {
                schema: { $ref: '#/components/schemas/AirImmunizationBundle' },
              },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [
          { OAuth2: ['system/Immunization.r'] },
          { OAuth2: ['air-admin/Immunization.r'] },
        ],
      },
    },

    // POST /fhir/R4/Immunization/$bulk-update
    '/fhir/R4/Immunization/$bulk-update': {
      post: {
        operationId: '$bulk-update',
        tags: ['Immunization'],
        summary: 'Bulk create/upsert immunisation events (atomic)',
        description: operationDocs['bulk-update'] || 'Atomic bulk create/upsert of immunisation events.',
        parameters: [
          { $ref: '#/components/parameters/X-Api-Key' },
          { $ref: '#/components/parameters/APIVersion' },
        ],
        requestBody: {
          description: 'FHIR Parameters resource containing `create` and/or `upsert` entries.',
          content: {
            'application/x-www-form-urlencoded': {
              schema: { $ref: '#/components/schemas/BulkUpdateInputParameter' },
            },
          },
        },
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': {
                schema: { $ref: '#/components/schemas/BulkUpdateOutputParameter' },
              },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/Immunization.c', 'system/Immunization.u'] }],
      },
    },

    // POST /fhir/R4/Immunization/$upsert
    '/fhir/R4/Immunization/$upsert': {
      post: {
        operationId: '$upsert',
        tags: ['Immunization'],
        summary: 'Upsert an immunisation event using deterministic matching',
        description: operationDocs['upsert'] || 'Upsert an immunisation event using a deterministic matching algorithm.',
        parameters: commonParams(),
        requestBody: {
          content: {
            'application/fhir+json': {
              schema: { $ref: '#/components/schemas/AirImmunization' },
            },
          },
        },
        responses: {
          200: { $ref: '#/components/responses/200' },
          201: { $ref: '#/components/responses/201' },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/Immunization.c', 'system/Immunization.u'] }],
      },
    },

    // POST /fhir/R4/Immunization/$process-message
    '/fhir/R4/Immunization/$process-message': {
      post: {
        operationId: 'acknowledge',
        tags: ['Messaging'],
        summary: 'Acknowledge an immunisation update notification',
        description: operationDocs['process-message'] || 'Updates an existing acknowledgement from SENT to RECEIVED status.',
        parameters: commonParams(),
        requestBody: {
          content: {
            'application/fhir+json': {
              schema: { $ref: '#/components/schemas/AcknowledgementBundle' },
            },
          },
        },
        responses: {
          200: {
            description: 'Acknowledgement received',
            content: {
              'application/fhir+json': {
                schema: { $ref: '#/components/schemas/OperationOutcome' },
              },
            },
          },
          401: { $ref: '#/components/responses/401' },
          403: { $ref: '#/components/responses/403' },
          422: { $ref: '#/components/responses/422' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/MessageHeader.u'] }],
      },
    },

    // GET /fhir/R4/Patient/{NHI}
    '/fhir/R4/Patient/{NHI}': {
      get: {
        operationId: 'readPatient',
        tags: ['Patient'],
        summary: 'Read an ImmSoT consumer (patient)',
        description: operationDocs['read-patient'] || 'Read the current state of an ImmSoT consumer returned as a FHIR Patient.',
        parameters: [
          { $ref: '#/components/parameters/NHI' },
          { $ref: '#/components/parameters/UserID' },
          { $ref: '#/components/parameters/X-Correlation-ID' },
          { $ref: '#/components/parameters/SourceSystemID' },
          { $ref: '#/components/parameters/X-Api-Key' },
          { $ref: '#/components/parameters/APIVersion' },
          {
            name: 'origin-nhi-version',
            in: 'header',
            required: false,
            description: 'If provided, the API compares this NHI version against the stored version and performs a consumer sync if they differ.',
            schema: { type: 'string' },
          },
        ],
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': { schema: { $ref: '#/components/schemas/AirPatient' } },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          404: { $ref: '#/components/responses/404' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/Patient.r'] }],
      },
    },

    // POST /fhir/R4/Patient/{NHI}/$update-state
    '/fhir/R4/Patient/{NHI}/$update-state': {
      post: {
        operationId: 'updatePatientState',
        tags: ['Patient'],
        summary: 'Update a consumer\'s state and/or sub-status',
        description: operationDocs['update-state'] || 'Updates the consumer state and/or sub-status with optimistic locking.',
        parameters: [
          { $ref: '#/components/parameters/NHI' },
          { $ref: '#/components/parameters/UserID' },
          { $ref: '#/components/parameters/X-Correlation-ID' },
          { $ref: '#/components/parameters/SourceSystemID' },
          { $ref: '#/components/parameters/X-Api-Key' },
          { $ref: '#/components/parameters/APIVersion' },
        ],
        requestBody: {
          content: {
            'application/fhir+json': { schema: { $ref: '#/components/schemas/PatientState' } },
          },
        },
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': { schema: { $ref: '#/components/schemas/AirPatient' } },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          404: { $ref: '#/components/responses/404' },
          412: { $ref: '#/components/responses/412' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/Patient.u'] }],
      },
    },

    // POST /fhir/R4/Patient/{NHI}/$reassign-schedules
    '/fhir/R4/Patient/{NHI}/$reassign-schedules': {
      post: {
        operationId: 'reassignSchedules',
        tags: ['Patient'],
        summary: 'Reassign immunisation schedules for a consumer',
        description: operationDocs['reassign-schedules'] || 'Cancels existing schedules and creates new ones based on the supplied onboarding date.',
        parameters: [
          { $ref: '#/components/parameters/NHI' },
          { $ref: '#/components/parameters/UserID' },
          { $ref: '#/components/parameters/X-Correlation-ID' },
          { $ref: '#/components/parameters/SourceSystemID' },
          { $ref: '#/components/parameters/X-Api-Key' },
          { $ref: '#/components/parameters/APIVersion' },
        ],
        requestBody: {
          content: {
            'application/fhir+json': { schema: { $ref: '#/components/schemas/PatientReassign' } },
          },
        },
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': { schema: { $ref: '#/components/schemas/AirPatient' } },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [
          { OAuth2: ['air-admin/Patient.u'] },
          { OAuth2: ['system/Patient.u'] },
        ],
      },
    },

    // GET /fhir/R4/Patient/{NHI}/_history
    '/fhir/R4/Patient/{NHI}/_history': {
      get: {
        operationId: 'patientHistory',
        tags: ['Patient'],
        summary: 'Retrieve all versions of an ImmSoT consumer',
        description: operationDocs['patient-history'] || 'Returns a history Bundle of all Patient versions including modification audit metadata.',
        parameters: [
          { $ref: '#/components/parameters/NHI' },
          { $ref: '#/components/parameters/X-Api-Key' },
          { $ref: '#/components/parameters/APIVersion' },
        ],
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': { schema: { $ref: '#/components/schemas/AirPatientBundle' } },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [
          { OAuth2: ['air-admin/Patient.r'] },
          { OAuth2: ['system/Patient.r'] },
        ],
      },
    },

    // GET /fhir/R4/CarePlan/$view
    '/fhir/R4/CarePlan/$view': {
      get: {
        operationId: 'viewCarePlans',
        tags: ['CarePlan'],
        summary: 'Read a consumer\'s immunisation plan/schedule',
        description: 'Returns a Bundle containing CarePlan, Immunization, and ImmunizationRecommendation resources for the specified consumer.',
        parameters: [
          { $ref: '#/components/parameters/UserID' },
          { $ref: '#/components/parameters/X-Correlation-ID' },
          { $ref: '#/components/parameters/X-Api-Key' },
          { $ref: '#/components/parameters/APIVersion' },
          {
            name: 'nhi',
            in: 'query',
            required: true,
            description: 'The NHI identifier of the patient/consumer.',
            schema: { type: 'string', example: 'ZCZ1947' },
          },
        ],
        responses: {
          200: {
            description: 'OK',
            content: {
              'application/fhir+json': { schema: { $ref: '#/components/schemas/CarePlanBundle' } },
            },
          },
          400: { $ref: '#/components/responses/400' },
          403: { $ref: '#/components/responses/403' },
          429: { $ref: '#/components/responses/429' },
          500: { $ref: '#/components/responses/500' },
        },
        security: [{ OAuth2: ['system/CarePlan.s'] }],
      },
    },
  },

  // ─── Components ──────────────────────────────────────────────────────────────
  components: {
    parameters: {
      ID: {
        name: 'ID',
        in: 'path',
        description: 'The logical ImmSoT ID of the immunisation event.',
        required: true,
        schema: { type: 'string' },
        example: 'e062d627-b565-48ae-9d7a-417db33ca64f',
      },
      NHI: {
        name: 'NHI',
        in: 'path',
        description: 'The NHI number identifying the patient/consumer.',
        required: true,
        schema: { type: 'string' },
        example: 'ZZZ7541',
      },
      UserID: {
        name: 'UserID',
        in: 'header',
        description: 'Identifier of the end user who submitted the request (for audit).',
        schema: { type: 'string' },
        example: 'Lionel.Messi',
      },
      'X-Correlation-ID': {
        name: 'X-Correlation-ID',
        in: 'header',
        description: 'Correlation UUID for request tracing and logging. A UUID is recommended.',
        schema: { type: 'string', format: 'uuid' },
      },
      FacilityID: {
        name: 'FacilityID',
        in: 'header',
        description: 'Identifier of the facility where the vaccination took place (HPI-F code).',
        schema: { type: 'string' },
        example: 'HSAPP0232',
      },
      SourceSystemID: {
        name: 'SourceSystemID',
        in: 'header',
        description: 'Identifier of the system that sent the request (ApplicationID from HIP Integration Application list).',
        schema: { type: 'string' },
        example: 'ISM',
      },
      'If-Match': {
        name: 'If-Match',
        in: 'header',
        description: 'Current ETag (versionId) of the resource for optimistic concurrency control. Required for update.',
        required: true,
        schema: { type: 'string' },
        example: '"3"',
      },
      'X-Api-Key': {
        name: 'x-api-key',
        in: 'header',
        description: 'API Gateway key. Required for all requests.',
        required: true,
        schema: { type: 'string' },
      },
      APIVersion: {
        name: 'APIVersion',
        in: 'header',
        description: 'API version selector. Omit or set to 1 for v1 behaviour; set to 2 for v2 behaviour.',
        required: false,
        schema: { type: 'integer', enum: [1, 2], default: 1 },
        example: 2,
      },
    },

    responses: {
      200: {
        description: 'OK',
        headers: {
          Location: { $ref: '#/components/headers/Location' },
          ETag:     { $ref: '#/components/headers/ETag' },
        },
        content: {
          'application/fhir+json': {
            schema: { $ref: '#/components/schemas/AirImmunization' },
          },
        },
      },
      201: {
        description: 'Created',
        headers: {
          Location: { $ref: '#/components/headers/Location' },
          ETag:     { $ref: '#/components/headers/ETag' },
        },
        content: {
          'application/fhir+json': {
            schema: { $ref: '#/components/schemas/AirImmunization' },
          },
        },
      },
      400: {
        description: 'Bad Request',
        content: { 'application/fhir+json': { schema: { $ref: '#/components/schemas/OperationOutcome' } } },
      },
      401: {
        description: 'Unauthorized',
        content: { 'application/fhir+json': { schema: { $ref: '#/components/schemas/OperationOutcome' } } },
      },
      403: {
        description: 'Forbidden',
        content: { 'application/fhir+json': { schema: { $ref: '#/components/schemas/OperationOutcome' } } },
      },
      404: {
        description: 'Not Found',
        content: { 'application/fhir+json': { schema: { $ref: '#/components/schemas/OperationOutcome' } } },
      },
      412: {
        description: 'Precondition Failed – version mismatch on optimistic lock',
        content: { 'application/fhir+json': { schema: { $ref: '#/components/schemas/OperationOutcome' } } },
      },
      422: {
        description: 'Unprocessable Entity – data validation failed',
        content: { 'application/fhir+json': { schema: { $ref: '#/components/schemas/OperationOutcome' } } },
      },
      429: {
        description: 'Too Many Requests',
        content: { 'application/fhir+json': { schema: { $ref: '#/components/schemas/OperationOutcome' } } },
      },
      500: {
        description: 'Internal Server Error',
        content: { 'application/fhir+json': { schema: { $ref: '#/components/schemas/OperationOutcome' } } },
      },
    },

    headers: {
      Location: {
        description: 'URL of the created/updated resource including version.',
        schema: { type: 'string', format: 'uri' },
        example: 'https://air.api.digital.health.nz/fhir/R4/Immunization/A80B69D0-DF65-4323-A75B-5818438BCBCE/_history/4',
      },
      ETag: {
        description: 'Version identifier of the resource.',
        schema: { type: 'string' },
        example: '"4"',
      },
    },

    schemas: {
      // ── Core resources ────────────────────────────────────────────────────
      AirImmunization: {
        type: 'object',
        description: 'FHIR Immunization resource conforming to the AIRImmunization profile.',
        properties: {
          resourceType: { type: 'string', enum: ['Immunization'] },
          id: { type: 'string', description: 'ImmSoT record ID (UUID).' },
          meta: {
            type: 'object',
            properties: {
              versionId:   { type: 'string', description: 'Version number.' },
              lastUpdated: { type: 'string', format: 'date-time' },
              profile:     { type: 'array', items: { type: 'string' } },
              extension:   { $ref: '#/components/schemas/DQExtension' },
            },
          },
          status:          { type: 'string', enum: ['completed', 'entered-in-error', 'not-done'] },
          statusReason:    { $ref: '#/components/schemas/CodeableConcept' },
          vaccineCode:     { $ref: '#/components/schemas/CodeableConcept' },
          patient:         { $ref: '#/components/schemas/LogicalReference' },
          occurrenceDateTime: { type: 'string', format: 'date-time' },
          location: {
            type: 'object',
            properties: {
              reference:  { type: 'string' },
              identifier: { $ref: '#/components/schemas/SimpleIdentifier' },
            },
          },
          lotNumber:      { type: 'string' },
          expirationDate: { type: 'string', format: 'date' },
          site:      { $ref: '#/components/schemas/CodeableConcept' },
          route:     { $ref: '#/components/schemas/CodeableConcept' },
          reasonCode: { $ref: '#/components/schemas/CodeableConceptArray' },
          performer: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                function: { $ref: '#/components/schemas/CodeableConcept' },
                actor: {
                  type: 'object',
                  properties: {
                    reference:  { type: 'string' },
                    identifier: { $ref: '#/components/schemas/SimpleIdentifier' },
                  },
                },
              },
            },
          },
          protocolApplied: {
            type: 'array',
            maxItems: 1,
            items: {
              type: 'object',
              properties: {
                targetDisease: { $ref: '#/components/schemas/CodeableConceptArray' },
                doseNumberPositiveInt: { type: 'integer' },
              },
            },
          },
          extension: { $ref: '#/components/schemas/AirExtension' },
          contained: { $ref: '#/components/schemas/Contained' },
        },
      },

      AirPatient: {
        type: 'object',
        description: 'FHIR Patient resource conforming to the AIRPatient profile.',
        properties: {
          resourceType: { type: 'string', enum: ['Patient'] },
          id:           { type: 'string', description: 'NHI number.' },
          meta: {
            type: 'object',
            properties: {
              versionId:   { type: 'string' },
              lastUpdated: { type: 'string', format: 'date-time' },
              profile:     { type: 'array', items: { type: 'string' } },
              extension:   { type: 'array', items: { type: 'object' } },
            },
          },
          identifier: { $ref: '#/components/schemas/IdentifierArray' },
          extension:  { type: 'array', items: { type: 'object' } },
          active:         { type: 'boolean' },
          deceasedBoolean: { type: 'boolean' },
          link: { type: 'array', items: { type: 'object' } },
        },
      },

      AirImmunizationBundle: {
        type: 'object',
        description: 'FHIR Bundle containing AIR Immunization resources.',
        properties: {
          resourceType: { type: 'string', enum: ['Bundle'] },
          id:           { type: 'string' },
          meta:         { type: 'object', properties: { lastUpdated: { type: 'string', format: 'date-time' } } },
          type:         { type: 'string', enum: ['searchset', 'history', 'collection'] },
          total:        { type: 'integer' },
          link:         { type: 'array', items: { type: 'object' } },
          entry:        { type: 'array', items: { $ref: '#/components/schemas/AirImmunization' } },
        },
      },

      OrchestrationImmunizationBundle: {
        type: 'object',
        description: 'FHIR Bundle containing enriched immunisation data including Patient, Location, Practitioner, and Organization resources.',
        properties: {
          resourceType: { type: 'string', enum: ['Bundle'] },
          id:           { type: 'string' },
          meta:         { type: 'object', properties: { lastUpdated: { type: 'string', format: 'date-time' } } },
          type:         { type: 'string' },
          total:        { type: 'integer' },
          link:         { type: 'array', items: { type: 'object' } },
          entry: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                fullUrl:  { type: 'string' },
                resource: { type: 'object', description: 'One of: Immunization, Patient, Location, Organization, Practitioner.' },
                search:   { type: 'object', properties: { mode: { type: 'string', enum: ['match', 'include'] } } },
              },
            },
          },
        },
      },

      AirPatientBundle: {
        type: 'object',
        description: 'FHIR Bundle containing AIR Patient history.',
        properties: {
          resourceType: { type: 'string', enum: ['Bundle'] },
          id:           { type: 'string' },
          type:         { type: 'string', enum: ['history'] },
          total:        { type: 'integer' },
          entry:        { type: 'array', items: { $ref: '#/components/schemas/AirPatient' } },
        },
      },

      AcknowledgementBundle: {
        type: 'object',
        description: 'FHIR Bundle (type=message) for immunisation update acknowledgement.',
        properties: {
          resourceType: { type: 'string', enum: ['Bundle'] },
          id:           { type: 'string' },
          type:         { type: 'string', enum: ['message'] },
          entry: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                fullUrl:  { type: 'string' },
                resource: { type: 'object' },
              },
            },
          },
        },
      },

      CarePlanBundle: {
        type: 'object',
        description: 'FHIR Bundle containing CarePlan, Immunization, and ImmunizationRecommendation resources for a consumer\'s immunisation schedule.',
        properties: {
          resourceType: { type: 'string', enum: ['Bundle'] },
          type:         { type: 'string' },
          link:         { type: 'array', items: { type: 'object' } },
          entry: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                fullUrl:  { type: 'string' },
                resource: { type: 'object', description: 'One of: CarePlan, Immunization, ImmunizationRecommendation.' },
              },
            },
          },
        },
      },

      OperationOutcome: {
        type: 'object',
        description: 'FHIR OperationOutcome resource.',
        properties: {
          resourceType: { type: 'string', enum: ['OperationOutcome'] },
          id:   { type: 'string' },
          text: { type: 'object', properties: { status: { type: 'string' }, div: { type: 'string' } } },
          issue: {
            type: 'array',
            items: {
              type: 'object',
              required: ['severity', 'code'],
              properties: {
                severity:    { type: 'string', enum: ['fatal', 'error', 'warning', 'information'] },
                code:        { type: 'string' },
                diagnostics: { type: 'string' },
                details:     { type: 'object' },
                expression:  { type: 'array', items: { type: 'string' } },
              },
            },
          },
        },
      },

      ManualMatching: {
        type: 'object',
        description: 'Parameters for manual match/unmatch operations.',
        properties: {
          resourceType: { type: 'string', enum: ['Parameters'] },
          parameter: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                name:         { type: 'string' },
                valueString:  { type: 'string' },
                valueCoding:  { type: 'object', properties: { code: { type: 'string' } } },
              },
            },
          },
        },
      },

      PatientState: {
        type: 'object',
        description: 'Parameters for updating consumer state.',
        properties: {
          resourceType: { type: 'string', enum: ['Parameters'] },
          parameter: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                name:         { type: 'string' },
                valueInteger: { type: 'integer' },
                valueString:  { type: 'string' },
              },
            },
          },
        },
        example: {
          resourceType: 'Parameters',
          parameter: [
            { name: 'version',   valueInteger: 1 },
            { name: 'state',     valueString: 'OVERSEAS' },
            { name: 'subStatus', valueString: 'UNDER_REVIEW' },
          ],
        },
      },

      PatientReassign: {
        type: 'object',
        description: 'Parameters for reassigning a consumer\'s immunisation schedules.',
        properties: {
          resourceType: { type: 'string', enum: ['Parameters'] },
          parameter: {
            type: 'array',
            maxItems: 1,
            items: {
              type: 'object',
              properties: {
                name:      { type: 'string', enum: ['reassignDate'] },
                valueDate: { type: 'string', format: 'date' },
              },
            },
          },
        },
        example: {
          resourceType: 'Parameters',
          parameter: [{ name: 'reassignDate', valueDate: '2024-04-01' }],
        },
      },

      BulkUpdateInputParameter: {
        type: 'object',
        description: 'FHIR Parameters resource for bulk-update input.',
        properties: {
          resourceType: { type: 'string', enum: ['Parameters'] },
          parameter: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                name:     { type: 'string', enum: ['create', 'upsert'] },
                resource: { $ref: '#/components/schemas/AirImmunization' },
              },
            },
          },
        },
      },

      BulkUpdateOutputParameter: {
        type: 'object',
        description: 'FHIR Parameters resource for bulk-update output.',
        properties: {
          resourceType: { type: 'string', enum: ['Parameters'] },
          parameter: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                name:     { type: 'string', enum: ['created', 'updated'] },
                resource: { $ref: '#/components/schemas/AirImmunization' },
              },
            },
          },
        },
      },

      // ── Reusable types ────────────────────────────────────────────────────
      LogicalReference: {
        type: 'object',
        description: 'FHIR logical reference. Use identifier (system + value) rather than a literal reference URL where possible.',
        properties: {
          reference:  { type: 'string', example: 'https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ7541' },
          identifier: { $ref: '#/components/schemas/SimpleIdentifier' },
        },
      },

      SimpleIdentifier: {
        type: 'object',
        properties: {
          system: { type: 'string', example: 'https://standards.digital.health.nz/ns/nhi-id' },
          value:  { type: 'string', example: 'ZZZ7541' },
        },
      },

      IdentifierArray: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            use:    { type: 'string', enum: ['official', 'old', 'temp', 'secondary'] },
            system: { type: 'string' },
            value:  { type: 'string' },
          },
        },
      },

      CodeableConcept: {
        type: 'object',
        properties: {
          coding: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                system:  { type: 'string' },
                version: { type: 'string' },
                code:    { type: 'string' },
                display: { type: 'string' },
              },
            },
          },
          text: { type: 'string' },
        },
      },

      CodeableConceptArray: {
        type: 'array',
        items: { $ref: '#/components/schemas/CodeableConcept' },
      },

      AirExtension: {
        type: 'array',
        description: 'FHIR extensions used by the AIR profile.',
        items: {
          type: 'object',
          properties: {
            url: { type: 'string' },
            valueReference:     { type: 'object', properties: { reference: { type: 'string' } } },
            valueCodeableConcept: { $ref: '#/components/schemas/CodeableConcept' },
            valueString:        { type: 'string' },
            valueDate:          { type: 'string', format: 'date' },
            valueBoolean:       { type: 'boolean' },
            extension:          { type: 'array', items: { type: 'object' } },
          },
        },
      },

      DQExtension: {
        type: 'array',
        description: 'Data Quality assessment extension in resource meta.',
        items: {
          type: 'object',
          properties: {
            url: { type: 'string', example: 'https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment' },
            extension: {
              type: 'array',
              items: {
                type: 'object',
                properties: {
                  url:          { type: 'string' },
                  valueInteger: { type: 'integer' },
                  valueString:  { type: 'string' },
                  valueBoolean: { type: 'boolean' },
                  valueDateTime: { type: 'string' },
                  extension:    { type: 'array', items: { type: 'object' } },
                },
              },
            },
          },
        },
      },

      Contained: {
        type: 'array',
        description: 'Contained resources (RelatedPerson, Observation).',
        items: {
          type: 'object',
          properties: {
            resourceType: { type: 'string' },
            id:           { type: 'string' },
          },
        },
      },
    },

    securitySchemes: {
      OAuth2: {
        type: 'oauth2',
        description: 'OAuth2 client credentials. Obtain a bearer token then include as `Authorization: Bearer <token>`.',
        flows: {
          clientCredentials: {
            tokenUrl: 'https://auth.integration.covid19.health.nz/oauth2/token',
            scopes: {
              'system/Immunization.c':    'Create immunisation events',
              'system/Immunization.r':    'Read immunisation events',
              'system/Immunization.u':    'Update immunisation events',
              'system/Immunization.s':    'Search immunisation events',
              'system/Immunization.crus': 'Full create, read, update and search',
              'air-admin/Immunization.c': 'Create immunisation events (admin)',
              'air-admin/Immunization.r': 'Read immunisation events (admin)',
              'air-admin/Immunization.s': 'Search immunisation events (admin)',
              'air-admin/Immunization.u': 'Update immunisation events (admin)',
              'system/Patient.r':         'Read consumer records',
              'system/Patient.u':         'Update consumer records',
              'air-admin/Patient.r':      'Read consumer records (admin)',
              'air-admin/Patient.u':      'Update consumer records (admin)',
              'system/CarePlan.s':        'Search/view care plans',
              'system/MessageHeader.u':   'Process notification acknowledgements',
            },
          },
        },
      },
      ApiKeyAuth: {
        type: 'apiKey',
        description: 'API Gateway key. Pass in the `x-api-key` header.',
        name: 'x-api-key',
        in: 'header',
      },
    },
  },

  tags: [
    { name: 'Immunization', description: 'Immunisation event CRUD, search, history, and custom operations.' },
    { name: 'Patient',      description: 'ImmSoT consumer (patient) read, state update, schedule reassignment, and history.' },
    { name: 'CarePlan',     description: 'Consumer immunisation plan/schedule view.' },
    { name: 'Messaging',    description: 'FHIR messaging – notification acknowledgement.' },
  ],
};

// ─── Write output ─────────────────────────────────────────────────────────────
const outDir = path.dirname(OUTPUT_FILE);
if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

let output;
if (FORMAT === 'json') {
  output = JSON.stringify(openapi, null, 2);
} else {
  output = yaml.dump(openapi, {
    indent: 2,
    lineWidth: 120,
    noRefs: false,
    quotingType: "'",
  });
}

fs.writeFileSync(OUTPUT_FILE, output, 'utf8');
console.log(`\n✅ OpenAPI spec written to: ${OUTPUT_FILE}`);
console.log(`   Format  : ${FORMAT.toUpperCase()}`);
console.log(`   Paths   : ${Object.keys(openapi.paths).length}`);
console.log(`   Schemas : ${Object.keys(openapi.components.schemas).length}`);
console.log(`   Version : ${version}`);
