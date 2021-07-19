sub subscription_id:
	az account set --subscription {{subscription_id}}
	export SUBSCRIPTION_ID={{subscription_id}}
principal sp_name:
	az ad sp create-for-rbac --name {{sp_name}} --create-cert | jq > secret.json
	export APP_ID=$(cat secret.json | jq .appId)
	export TENANT_ID=$(cat secret.json | jq .tenant)
	export CERT=$(cat secret.json | jq .fileWithCertAndPrivateKey)
	export SP_NAME=$(cat secret.json | jq .displayName)
assign sp_name:
	az role assignment create --assignee {{sp_name}} --role contributor --scope /subscriptions/$SUBSCRIPTION_ID

sp_login:
	az login --service-principal --username $APP_ID --tenant $TENANT_ID --password $CERT


init:
	terraform init 

plan: 
	terraform plan input=false -out=tfplan

apply:
	terraform apply -input=false tfplan

   

