.PHONY: plan
plan: init
	terraform plan

.PHONY: apply
apply: init
	terraform apply

.PHONY: destroy
destroy: init
	terraform destroy

.PHONY: init
init:
	terraform init

.PHONY: format
format:
	terraform fmt --recursive

