```bash
export ARM_CLIENT_ID=$(cat secret.json | jq .appId)
export ARM_CLIENT_SECRET=$(cat secret.json | jq .password)
export ARM_SUBSCRIPTION_ID=$SUBSCRIPTION_ID
export ARM_TENANT_ID=$(cat secret.json | jq .tenant)
```