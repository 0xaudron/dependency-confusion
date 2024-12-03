mkdir ~/$1 && cd ~/$1
npm init --yes
echo "console.log('testing dependency conf');" > index.js
npm publish --access public --auth-type=legacy --token=$NPM_TOKEN