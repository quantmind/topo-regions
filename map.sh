#!/bin/bash

rm -rvf world

world_shp() {
  mkdir -p build
  curl -z build/ne_$1_admin_0_countries.zip -o build/ne_$1_admin_0_countries.zip http://naciscdn.org/naturalearth/$1/cultural/ne_$1_admin_0_countries.zip
  unzip -od build build/ne_$1_admin_0_countries.zip
  chmod a-x build/ne_$1_admin_0_countries.*
}

world() {
  world_shp $1
  mkdir -p world
  ./node_modules/.bin/geo2topo -q 1e5 -n countries=<( \
      ./node_modules/.bin/shp2json -n build/ne_$1_admin_0_countries.shp \
        | ./node_modules/.bin/ndjson-map 'i = d.properties.iso_n3, d.id = i === "-99" ? undefined : i, delete d.properties, d' \
        | ./node_modules/.bin/geostitch -n) \
    | ./node_modules/.bin/topomerge land=countries \
    > world/$1.json
  ./node_modules/.bin/shp2json -n build/ne_$1_admin_0_countries.shp \
    | ./node_modules/.bin/ndjson-map 'd.properties' \
    | ./node_modules/.bin/ndjson-sort 'a.iso_a3.localeCompare(b.iso_a3)' \
    | ./node_modules/.bin/json2tsv -n \
    > world/$1.tsv
}

world $1
