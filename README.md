# ensatus

Ensatus.sh v.0 (there will be no other versions...)

Proof of concept diversion generation script.
Concept is simple, go out get a random "dirty host" via
Spamhaus then use that host as a source of an attack. To
be used while one is say performing a penetration test.
The goal is simple to generate dirty traffic in an effort
to "blend in with the crowd." (so much for pinpointing
those APT sources) 

This script was never intended to be used for malicious
purposes, and was created during an internal penetration
test, where I needed to perform the following tests:

1) Ensure SIEM/IPS analysts were monitoring events
2) Generate pseudo malicious traffic that QRadar would flag
3) Generate garbage traffic to deflect attention from me
