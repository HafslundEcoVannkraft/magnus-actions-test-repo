#!/usr/bin/env bash

# This script is for logging in to Azure using federated credentials.
# As opposed to the azure/login action, this script can be used in a
# loop or other flow control structures.

oidc_token=$(curl -H "Authorization: bearer $ACTIONS_ID_TOKEN_REQUEST_TOKEN" "$ACTIONS_ID_TOKEN_REQUEST_URL&audience=api://AzureADTokenExchange"| jq -r '.value')
az login --service-principal --username 189ee463-4982-4960-a6de-c46d9c4397a8 --tenant 18704e99-efc6-4fc7-9f7d-529190c7a11a --federated-token $oidc_token --allow-no-subscriptions
az resource show --ids /subscriptions/142a6373-05c8-4f0c-b84c-66d3100aa6bc/resourceGroups/scope1

# url="https://login.microsoftonline.com/${tenant_id}/oauth2/v2.0/token"

# # we want scopes likes this
# # "scp": "AuditLog.Read.All Directory.AccessAsUser.All email Group.ReadWrite.All openid profile User.ReadWrite.All"
# scopes="https://graph.microsoft.com/.default"
# body="client_id=${client_id}&scope=${scope}&grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer&client_assertion=${oidc_token}"
# response=$(curl -X POST -d "$body" -H "Content-Type: application/x-www-form-urlencoded" $url --fail --verbose)
# echo "response: $response"

# 


# # 3 - Use the GitHub JWT as proof for authenticating as the app defined in env.CLIENT_ID:
#               $uri = "https://login.microsoftonline.com/{0}/oauth2/v2.0/token" -f "${{env.TENANT_ID}}"
#               $body = "scope=https://graph.microsoft.com/.default&client_id=${{env.CLIENT_ID}}&grant_type=client_credentials&client_assertion_type=urn:ietf:params:oauth:client-assertion-type:jwt-bearer&client_assertion={0}" -f [System.Net.WebUtility]::UrlEncode($githubjwt.Value)
#               $aadtoken = Invoke-RestMethod $uri -Body $body -ContentType "application/x-www-form-urlencoded" -ErrorAction SilentlyContinue