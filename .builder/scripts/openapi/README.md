# AIR ImmSoT OpenAPI Generator

## Overview

This tool generates the OpenAPI 3.0 specification for the AIR ImmSoT FHIR API
directly from the FHIR Implementation Guide's `capabilitystatement.fsh`.

**The `capabilitystatement.fsh` is the single source of truth.**  
Every time you update the IG, re-run this script to regenerate the OpenAPI spec.

---

## Project Structure

```
fsh/
  capabilitystatement.fsh     ← single source of truth (edit this)
  air-immunization-prf.fsh
  air-bulk-update-op.fsh
  air-upsert-op.fsh
  ...
openapi/
  air-immsot-api.yaml         ← generated (do not edit manually)
  air-immsot-api.json         ← generated (do not edit manually)
scripts/
  generate-openapi.js         ← generator script
  package.json
```

---

## Quick Start

```bash
# Install dependencies (once)
npm install

# Generate YAML (default, reads ../fsh/capabilitystatement.fsh)
npm run generate

# Generate JSON
npm run generate:json

# Generate both formats
npm run generate:both
```

### Custom paths

```bash
node generate-openapi.js \
  --input  path/to/capabilitystatement.fsh \
  --output path/to/output.yaml \
  --format yaml        # or json
```

---

## What the generator extracts from FSH

| FSH element | OpenAPI output |
|---|---|
| `* version = "x.y.z"` | `info.version` |
| `* title = "..."` | `info.title` |
| `* rest.resource[=].interaction[=].code` | HTTP method + path |
| `* rest.resource[=].interaction[=].documentation` | `description` for each operation |
| `* rest.operation[=].name` + `.documentation` | Custom operation paths (`$upsert`, `$bulk-update`, etc.) |
| `* rest.resource[=].searchParam` | Query parameters on `_search` |
| `* rest.security.*` | `components.securitySchemes` |

---

## Workflow: IG update → OpenAPI regeneration

1. **Edit `capabilitystatement.fsh`** to add/change/remove:
   - a resource interaction → update the interaction `documentation` block
   - a new operation → add a `rest.resource[=].operation` entry with full `documentation`
   - a search parameter → add a `rest.resource[=].searchParam` entry

2. **Bump the version** in `capabilitystatement.fsh`:
   ```fsh
   * version = "2.2.0"
   ```

3. **Run the generator**:
   ```bash
   npm run generate:both
   ```

4. **Review** `openapi/air-immsot-api.yaml` – spot-check new paths, schemas, descriptions.

5. **Commit both files** together so the OpenAPI spec stays in sync with the FSH source.

---

## Schema conventions

- All FHIR resource schemas are defined in `components/schemas`.
- The generator includes schemas for all profiles referenced in the CapabilityStatement.
- For new profiles, add a corresponding schema entry in the `components.schemas` block of `generate-openapi.js`.

---

## Extending the generator

The generator (`generate-openapi.js`) is structured so adding a new endpoint is straightforward:

1. Add the FSH operation/interaction to `capabilitystatement.fsh`.
2. Add the path entry to the `paths` object in `generate-openapi.js`.
3. Add any new schemas to `components.schemas`.
4. Re-run `npm run generate:both`.

---

## Version alignment

The `capabilitystatement.fsh` version (`* version = "x.y.z"`) is automatically
propagated to `info.version` in the generated OpenAPI spec. Keep these in sync
with your IG package version in `package.json`.
