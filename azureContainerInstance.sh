# Script to create an Azure Container Instance.  This assumes you already have a resource group established on Azure.

DNS_NAME_LABEL=test-nodejs-app-$RANDOM

az container create \
  --resource-group << RESOURCE-GROUP >> \
  --name test-nodejs-app \
  --image visualjeff/test-nodejs-app:latest \
  --ports 1337 \
  --dns-name-label $DNS_NAME_LABEL \
  --location westus2

az container show \
  --resource-group << RESOURCE-GROUP  >> \
  --name test-nodejs-app \
  --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
  --out table


