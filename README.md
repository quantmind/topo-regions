# World Atlas TopoJSON

This repository provides a convenient mechanism for generating [TopoJSON][] files from [Natural Earth](http://www.naturalearthdata.com/)’s [vector data](http://www.naturalearthdata.com/downloads/), version 2.0.0.

## Installing

Before you can run `make`, you’ll need to install the node packages
```bash
yarn install
```

If you want to install this software using an alternate method see the website for [TopoJSON](https://github.com/mbostock/topojson). I also recommend reading the tutorial, [Let’s Make a Map](http://bost.ocks.org/mike/map/).

## Make Targets

To create all targets:

    make all

alternatively, for Admin 0 country boundaries at 1:10,000,000 scale:

    make topo/world-10m.json


Admin 0 country boundaries at 1:50,000,000 scale:

    make topo/world-50m.json

and Admin 0 country boundaries at 1:110,000,000 scale:

    make topo/world-110m.json


If you want to generate a custom map, I recommend modifying the Makefile. Or, just use the Makefile as a set of examples, and run the appropriate `ogr2ogr` and `topojson` commands from the terminal.


Shapefiles
==============

To obtain information of of shapefile:

    ogrinfo -al ne_110m_admin_0_countries.shp >> info.txt


[TopoJSON]: https://github.com/topojson/topojson
