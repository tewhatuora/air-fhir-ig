CodeSystem: NZVXImmunisationCode
Id: immunisation-code
Title: "NZVX Immunisation Code"
Description: "Antigen code set for vaccines administered in New Zealand (NZVX)."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/ns/immunisation-code"

* ^experimental = false
* ^caseSensitive = false

// Added for IMM-3229
* #52101 "HepA-Typhoid"

// note that NIR spec doc has this as 90306, but there are 800,000+ records with 090306 and only 32 with 90306
// so I've changed the code to 090306
* #090306 "PCV unspecified"

* #90906 "Td"
* #99001 "DTaP-IPV"
* #99002 "MeNZB"
* #99003 "Diphtheria, paed"
* #99004 "aP"
* #99005 "Diphtheria, adult"
* #99006 "Influenza"
* #99007 "HepA"
* #99008 "MenACWY"
* #99009 "Rabies"
* #99010 "RIG"
* #99011 "Tdap-IPV"
* #99012 "Tdap"
* #99013 "MenC"
* #210307 "DTaP-IPV-HepB/Hib"
* #260209 "PCV10"

// * #EVP "EVP"

* #EVPMnC "MenC"
