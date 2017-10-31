#!/bin/bash

rm -rvf world

state_shp () {
  mkdir -p build/$1
  rm -rf $1_adm_shp.zip
  wget http://biogeo.ucdavis.edu/data/gadm2.8/shp/$1_adm_shp.zip
  unzip -od build/$1 $1_adm_shp.zip
  rm -rf $1_adm_shp.zip
}

state () {
    if [ -d build/$1 ]; then
        echo build/$1 already available - skip download
    else
        state_shp $1
    fi
    mkdir -p world
    # shp2json build/$1/$1_adm$2.shp -o world/$1_adm$2.geo.json
    geo2topo -q 1e3 -n regions=<( \
            shp2json -n build/$1/$1_adm$2.shp) \
        | topomerge country=regions \
        > world/$1_adm$2.topo.json
    cp build/$1/$1_adm$2.csv world/$1_adm$2.csv
}

state CHE 1
state CYP 1
state DEU 1
state DNK 1
state ESP 1
state FRA 1
state GBR 1
state GBR 2
state ITA 1
state NOR 1
state POL 1
state PRT 1
state ROU 1
state RUS 1
state SVN 1
state SWE 1
