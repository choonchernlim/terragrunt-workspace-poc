# Terragrunt Workspace POC

An example on how you might configure your Git Repo to provision resources like cattle using Terragrunt.

## Setup

If service account is not activated, use your credential:

```shell
gcloud auth login && gcloud auth application-default login    
```

Update `vars/dev.yml` to point to your project and buckets.

```
export ENVIRONMENT=dev 
export TF_BACKEND_PROJECT=level-clone-350517 
export TF_BACKEND_BUCKET=gcp-terragrunt-demo-1 
export TF_BACKEND_LOCATION=us-central1 

terragrunt run-all plan
```

## Plan

Run the following command at root dir:

```shell
ENVIRONMENT=dev terragrunt run-all plan    
```

## Apply

Run the following command at root dir:

```shell
ENVIRONMENT=dev terragrunt run-all apply
```

## Destroy

## Using `destroy`

Run the following command at root dir:

```shell
ENVIRONMENT=dev terragrunt run-all destroy
```

This is a preferred approach as it will destroy the modules in the right order if there are dependencies between them.

## Using `apply`

Go to a child `terragrunt.hcl` to be destroyed.

Disable the source inheritance from root `terragrunt.hcl` by replacing the following...

```hcl
include {
  path = find_in_parent_folders()
}

inputs = {
  folder_name = "folder-1"
}
```

... with...

```hcl
include {
  path = find_in_parent_folders()
}

terraform {
  source = ".//."
}
```

Then, run these commands:

```shell
ENVIRONMENT=dev terragrunt run-all apply
```
