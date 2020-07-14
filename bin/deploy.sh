#!/bin/sh

PROJECT=super-big-data
IMAGE=gcr.io/${PROJECT}/product-eng-webhooks

env_vars="ENV=production,"
env_vars="${env_vars}GH_APP_IDENTIFIER=${GH_APP_IDENTIFIER},"
env_vars="${env_vars}GH_APP_SECRET_KEY=${GH_APP_SECRET_KEY},"
env_vars="${env_vars}GH_WEBHOOK_SECRET=${GH_WEBHOOK_SECRET},"
env_vars="${env_vars}VERSION=${VERSION},"
env_vars="${env_vars}SENTRY_WEBPACK_WEBHOOK_SECRET=${SENTRY_WEBPACK_WEBHOOK_SECRET},"

gcloud builds submit --tag $IMAGE --project=$PROJECT --gcs-log-dir=gs://${PROJECT}_cloudbuild/logs && \
gcloud run deploy product-eng-webhooks \
  --image $IMAGE \
  --set-env-vars="$env_vars" \
  --project=$PROJECT \
  --platform managed \
  --allow-unauthenticated \
  --region=us-west1


