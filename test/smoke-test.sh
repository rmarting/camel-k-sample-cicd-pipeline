set -ex
# NOTE: the test can be as much complete as required by the service
#

# Just make sure the endpoint don't fail
HTTP_GET=$(curl -o /dev/null -s -w "%{http_code}\n" http://$1/customers)
if [ "$HTTP_GET" != "200" ]; then
    echo "ERROR: expected a 200 HTTP code"
    exit 1
fi
