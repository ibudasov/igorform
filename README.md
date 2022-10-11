# Seated Ticketing Terraform

```bash
curl https://sdk.cloud.google.com | bash # inctall GCP CLI client
brew install terraform
brew install terragrunt
```

## Requirements
1. If you are already logged in, make sure you are on the correct project.
2. Make sure that a cloud storage bucket is available that you have access to.

## Steps

Step 1:
Login with an account that has the correct credentials
```bash
gcloud auth application-default login
```

Step 2:
Execute the following command. Change where needed

### Development
```bash
MAKE A COPY FIRST
terraform init -backend-config="environments/test/state-backend.tf"
terraform plan -var-file=environments/test/config.tf -out=tfplan.planned
```

Check plan for your changes. If agreed, perform final step.

Step 3:
Execute the following command
```bash
terraform apply tfplan.planned
```

# TODO:
Fill in the test environment settings.
