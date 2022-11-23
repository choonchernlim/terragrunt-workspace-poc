
plan:
ifdef DIR
	terragrunt plan --terragrunt-working-dir=$(DIR)
else
	terragrunt run-all plan --terragrunt-exclude-dir=.
endif

apply:
ifdef DIR
	terragrunt apply --terragrunt-working-dir=$(DIR) -auto-approve
else
	terragrunt run-all apply --terragrunt-exclude-dir=. --terragrunt-non-interactive
endif
