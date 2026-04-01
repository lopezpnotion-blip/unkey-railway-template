#!/bin/sh

set -e

echo "Bootstrapping Unkey..."

# Check for required env var
if [ -z "$UNKEY_ROOT_KEY" ]; then
  echo "Error: UNKEY_ROOT_KEY is not set"
  exit 1
fi

# Install CLI locally (no global issues)
npx --yes unkey --version > /dev/null

echo "Creating API..."

API_RESPONSE=$(npx unkey api apis create-api \
  --name="default-api" \
  --output=json)

API_ID=$(echo "$API_RESPONSE" | grep -o '"id":"[^"]*"' | head -n1 | cut -d'"' -f4)

if [ -z "$API_ID" ]; then
  echo "Failed to create API"
  echo "$API_RESPONSE"
  exit 1
fi

echo "Created API: $API_ID"

echo "Creating API key..."

KEY_RESPONSE=$(npx unkey api keys create-key \
  --api-id="$API_ID" \
  --name="default-key" \
  --enabled \
  --output=json)

KEY=$(echo "$KEY_RESPONSE" | grep -o '"key":"[^"]*"' | head -n1 | cut -d'"' -f4)

if [ -z "$KEY" ]; then
  echo "Failed to create API key"
  echo "$KEY_RESPONSE"
  exit 1
fi

echo "API Key: $KEY"

echo "Bootstrap complete"
