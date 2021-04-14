api_url="https://api.cloudways.com/api/v1"
echo $api_url

token=$(curl "${api_url}/oauth/access_token?email=${INPUT_EMAIL}"&api_key=${INPUT_API_KEY}"" | jq -r ".access_token")
echo $token

result=$(curl -XPOST -H "Authorization: Bearer ${token}" "${api_url}/app/manage/webroot?app_id=${APP_ID}"&server_id=${INPUT_SERVER_ID}"&webroot=${INPUT_WEBROOT}"" | jq -r ".status" )
echo "::set-output name=success::$result"