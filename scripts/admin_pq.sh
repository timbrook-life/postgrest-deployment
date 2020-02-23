#!/bin/bash

CREDS=$(vault read postgresql/creds/admin -format=json)

LEASE_ID=$(echo $CREDS | jq '.lease_id' -r)
USER=$(echo $CREDS | jq '.data.username' -r)

echo "Logging in as $USER"

PGPASSWORD=$(echo $CREDS | jq '.data.password' -r) psql \
  --set sslmode=require \
  --username $USER \
  --host "personal-site-managed-do-user-3469191-0.db.ondigitalocean.com" \
  --port 25060 \
  -d notification

echo "Done, cleaning up credentials"
vault lease revoke $LEASE_ID
