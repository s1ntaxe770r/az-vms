# set azure subscription 
sub subscription_id:
	az account set --subscription {{subscription_id}}
	export SUBSCRIPTION_ID={{subscription_id}}

## create a service principal
principal sp_name:
	az ad sp create-for-rbac --name={{sp_name}} --role="Contributor" --scopes="/subscriptions/$SUBSCRIPTION_ID"  |  jq > secret.json

# login with service principal
sp_login:
	az login --service-principal --username $APP_ID --tenant $TENANT_ID --password $CERT

# initialize terraform backend
init:
	terraform init 

# create a plan
plan:
	terraform plan -out=tfplan 
# terraform apply 
apply:
	terraform apply tfplan


# delete service principal
sp-delete:
		az ad sp delete --id=$(cat secret.json | jq .displayName)


