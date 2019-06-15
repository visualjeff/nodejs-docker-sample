# Script to create an Azure Container Instance.  This assumes you already have a resource group established on Azure.

DNS_NAME_LABEL=nodejs-docker-sample-$RANDOM

az container create \
  --resource-group << RESOURCE-GROUP >> \
  --name nodejs-docker-sample \
  --image visualjeff/nodejs-docker-sample:latest \
  --ports 1337 \
  --dns-name-label $DNS_NAME_LABEL \
  --location westus2

az container show \
  --resource-group << RESOURCE-GROUP  >> \
  --name nodejs-docker-sample \
  --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
  --out table


