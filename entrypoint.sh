#!/bin/bash

api_url="https://api.cloudways.com/api/v1"
echo $api_url

token=$(curl "${api_url}/oauth/access_token?email=${INPUT_EMAIL}&api_key=${INPUT_API_KEY}" | jq -r ".access_token")
echo $token
if [[ $token = "null" ]]; then
  echo "Could not obtain access token, check account email and api key."
  exit 1
fi

result=$(curl -XPOST -H "Authorization: Bearer ${token}" "${api_url}/app/manage/webroot?app_id=${INPUT_APP_ID}&server_id=${INPUT_SERVER_ID}&webroot=${INPUT_WEBROOT}" | jq -r ".status" )
echo $result
if [[ ! $result = "true" ]]; then
  echo "Could not change webroot, check App & Site ID's are correct."
  exit 1
fi

echo "Webroot successfully updated to [${INPUT_WEBROOT}]"

echo "::set-output name=success::$result"