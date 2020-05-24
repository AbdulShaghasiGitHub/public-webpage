# !important you have to first source aws credentials
set_backend:
	# 1. initialise backend configs
	@terraform init

	# 2. validate and format backend code
	@terraform validate
	@terraform fmt

	# 3. plan backend code
	@terraform plan

	# 4. deploy backend
	@terraform apply -auto-approve

down:
	terraform destroy --auto-approve
