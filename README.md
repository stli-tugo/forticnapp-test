# FortiCNAPP code security test repo

This repo contains deliberately insecure sample code for testing FortiCNAPP detection.
Nothing here is deployed, installed or run. Do not reuse any of it.

Planted issues:
- SCA: package.json and package-lock.json pin lodash 4.17.15; app/requirements.txt pins Flask 0.12.2 (both have published CVEs)
- SAST: app/app.py builds a SQL query from user input (SQL injection)
- Secrets: app/config.py contains a fake, non-working AWS-style key pair
- IaC: terraform/main.tf has a public-read S3 bucket and SSH open to 0.0.0.0/0
