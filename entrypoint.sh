#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

api_url="https://api.cloudways.com/api/v1"
echo $api_url

token=$(curl "${api_url}/oauth/access_token?email=${INPUT_EMAIL}&api_key=${INPUT_API_KEY}" | jq -r ".access_token")
echo $token
if [[ $token = "null" ]]; then
  echo "${RED}Could not obtain access token, check account email and api key.${NC}"
  exit 1
fi

result=$(curl -XPOST -H "Authorization: Bearer ${token}" "${api_url}/app/manage/webroot?app_id=${INPUT_APP_ID}&server_id=${INPUT_SERVER_ID}&webroot=${INPUT_WEBROOT}" | jq -r ".status" )
echo $result
if [[ ! $result = "true" ]]; then
  echo "${RED}Could not change webroot, check App & Site ID's are correct.${NC}"
  exit 1
fi

echo "${GREEN}Webroot successfully updated to [${INPUT_WEBROOT}]${NC}"

echo "::set-output name=success::$result"