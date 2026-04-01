# Unkey API Management (Railway Template)

Deploy Unkey.dev with MySQL and Redis in one click.

## Features

- One-click deploy on Railway
- MySQL database (persistent)
- Redis (rate limiting + caching)
- Auto-generated secure credentials
- Health checks configured
- Zero manual setup required

## Deploy

Click Deploy and you're done.

No configuration needed.

## Environment Variables

| Variable | Description |
|----------|------------|
| UNKEY_ROOT_KEY | Auto-generated root key |
| MYSQL_PASSWORD | Auto-generated database password |
| UNKEY_DATABASE_PRIMARY | Internal DB connection |
| UNKEY_REDIS_URL | Internal Redis connection |

## After Deploy

- Open the `unkey` service in Railway
- Use the generated domain to access the API
- Start creating API keys immediately

## Health Check
