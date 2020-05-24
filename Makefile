# initialize terraform with remote backend configs and standup the infrastructure
up:
	# 1. initialise terraform with a remote backend
	@cd infra && terraform init --backend-config="key=state/terraform.tfstate" --backend-config="dynamodb_table=APP-locktable-$(shell cd backend_config && terraform output backend_id)" --backend-config="bucket=app-tfstate-$(shell cd backend_config && terraform output backend_id)"

	# 2. validate and format infrastructure code
	@cd infra && terraform validate
	@cd infra && terraform fmt

	# 3. plan infrastructure code
	@cd infra && terraform plan

	# 4. deploy the infrastructure
	@cd infra && terraform apply --auto-approve

	# 5. create db.sql file for db connectivity -- db for user authentication
	@sh creds.sh

# destroy all deployed resources -- both infra and backend
down:
	# (1) Destroy infrastructure using the remote state files
	@make destroy_infra
	
	# (2) Clean all terraform files -- must be done because statefile for infra backend remembers previous s3 bucket and table
	@cd infra && rm -rf .terraform terraform.tfstate terraform.tfstate.backup .terraform.tfstate.lock.info
	
	# (3) Destroy remote backend resources
	@cd backend_config && terraform destroy --auto-approve

# ##############################################  Arguments for testing purposes ##################################################

# (1) run ansible script alone
run_ansible:
	@cd ansible && sh run_ansible.sh
	@make outputs

# (2) refresh argument is used to refresh state of the terraform, without having to apply changes. It is used in cases where we want to retrieve output in terraform.
refresh:
	# refresh state of backend code
	@cd backend_config && terraform refresh

	# refresh state of infrastructure
	@cd infra && terraform refresh

# (3) output argument is used to display result of terraform outputs file 
outputs:
	# display output of deployed infrastructure
	@cd infra && terraform output

	# display output of deployed backend
	@cd backend_config && terraform output

# (4) destroy backend
destroy_backend:
	@cd backend_config && terraform destroy --auto-approve

# (5) destroy infra
destroy_infra:
	@cd infra && terraform destroy --auto-approve

# (6) clean argument is used to remove terraform generated dir and files
clean:
	@cd infra && rm -rf .terraform terraform.tfstate terraform.tfstate.backup .terraform.tfstate.lock.info
	@cd backend_config && rm -rf .terraform terraform.tfstate terraform.tfstate.backup .terraform.tfstate.lock.info

# (7) backend configurations
set_backend:
	@cd backend_config && make set_backend