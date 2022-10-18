set -x
# NOTE: the test can be as much complete as required by the service
#

# Create a user
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"name":"my-name","city":"my-city"}' \
  http://$1/customers/

# Read the user
HTTP_GET=$(curl -o /dev/null -s -w "%{http_code}\n" http://$1/customers/my-name)
if [[ "$HTTP_GET" != "200" ]]; then
    echo "ERROR: expected a 200 HTTP code"
    exit 1
fi

# Delete the user
HTTP_DELETE=$(curl -o /dev/null -s -w "%{http_code}\n" --request DELETE http://$1/customers/my-name)
if [[ "$HTTP_DELETE" != "200" ]]; then
    echo "ERROR: expected a 200 HTTP code"
    exit 2
fi
