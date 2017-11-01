#!/bin/bash

# assets directory
mkdir -p website/assets

#
# install es6-promise & fetch for IE
cp node_modules/es6-promise/dist/es6-promise.auto.min.js website/assets/
cp node_modules/whatwg-fetch/fetch.js website/assets/
#
node dev/site.js
cp -r site/config website/.
# copy circle.yml
cp circle.yml website/.
