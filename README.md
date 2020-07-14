# cloud-run-typescript-template

Get started quickly with typescript on Google Cloud Run

## Development

```sh
# Install dependencies
yarn install

# Start dev
yarn dev
```

### Google Cloud Platform

You'll need to setup a GCP project that has access to Google Cloud Run. You should create a service account that has the following roles: `Cloud Run Admin` and `Service Account User`.

You'll also need to create a private key for the service account (it should download a JSON file). You'll want to run `base64 <path/to/json>` and set it as the `GOOGLE_APPLICATION_CREDENTIALS` secret in GitHub.
