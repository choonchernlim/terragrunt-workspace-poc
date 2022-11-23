
plan:
ifdef DIR
	terragrunt plan --terragrunt-working-dir=$(DIR)
else
	terragrunt run-all plan --terragrunt-exclude-dir=.
endif

plan-destroy:
ifdef DIR
	terragrunt plan --terragrunt-working-dir=$(DIR) -destroy
else
	terragrunt run-all plan --terragrunt-exclude-dir=. -destroy
endif

apply:
ifdef DIR
	terragrunt apply --terragrunt-working-dir=$(DIR) -auto-approve
else
	terragrunt run-all apply --terragrunt-exclude-dir=. --terragrunt-non-interactive
endif

destroy:
ifdef DIR
	terragrunt destroy --terragrunt-working-dir=$(DIR) -auto-approve
else
	terragrunt run-all destroy --terragrunt-exclude-dir=. --terragrunt-non-interactive
endif
