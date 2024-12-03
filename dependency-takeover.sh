#Check if directory exists
if [ -d "/tmp/$1" ]; then
  cd /tmp/$1
else
  # If it doesn't exist, create it and then change into it
  mkdir /tmp/$1 && cd /tmp/$1
fi

init=$(npm init --yes 2>&1)
echo "console.log('testing dependency conf');" > index.js
output=$(npm publish --access public --auth-type=legacy --token=$NPM_TOKEN 2>&1)
echo "========================================================"

echo "$output" | grep -q "npm ERR!" && echo "It is not possible to publish the package - $1" || echo "Dependency takeover successful for - $1"
echo "========================================================"
echo "$output"
