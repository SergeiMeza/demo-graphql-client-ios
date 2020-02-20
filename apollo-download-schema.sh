echo "Downloading schema"

yarn apollo schema:download --endpoint=https://api.lpp.pw/v1/graphql 

sleep 2

cp ./schema.json ./demo-client-ios/schema.json

rm ./schema.json

echo "Success"