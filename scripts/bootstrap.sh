#!/bin/sh

echo "Bootstrapping Unkey..."

# install CLI
npm install -g unkey

# auth using env var
export UNKEY_ROOT_KEY=$UNKEY_ROOT_KEY

# create API
API_ID=$(unkey api apis create-api --name="default-api" --output=json | jq -r '.data.id')

echo "Created API: $API_ID"

# create key
KEY=$(unkey api keys create-key --api-id=$API_ID --name="default-key" --enabled --output=json | jq -r '.data.key')

echo "API Key: $KEY"

echo "Bootstrap complete"
