# Terragrunt Workspace POC

A very opinionated way to provision GCP resources like cattle using Terragrunt.

## Setup

If service account is not used, use your credential instead:

```shell
gcloud auth login && gcloud auth application-default login    
```

Expose the following environment variables:

```shell
# Load tfvars/dev.tfvars 
export ENVIRONMENT=dev

# For remote state configuration, replace the values accordingly
export TF_BACKEND_PROJECT=[GCP_PROJECT_ID] 
export TF_BACKEND_BUCKET=[GCP_BUCKET_NAME] 
export TF_BACKEND_LOCATION=[GCP_BUCKET_LOCATION] 
```

## Plan

Run the following command at root dir:

```shell
terragrunt run-all plan    
```

## Apply

Run the following command at root dir:

```shell
terragrunt run-all apply
```

## Destroy

## Using `destroy`

Run the following command at root dir:

```shell
terragrunt run-all destroy
```

This is a preferred approach as it will destroy the modules in the right order if there are dependencies between them.

## Using `apply`

Go to a child `terragrunt.hcl` to be destroyed.

Disable the source inheritance from root `terragrunt.hcl` by changing the following...

```hcl
include "root" {
  path = find_in_parent_folders()
}

include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

inputs = {
  folder_name = "folder-1"
}
```

... with...

```hcl
include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

terraform {
  source = ".//."
}
```

Then, run these commands:

```shell
terragrunt run-all apply
```
