cd .. && git clone git@github.com:quantmind/topo-regions.git gh-pages
cd gh-pages && git checkout -b gh-pages origin/gh-pages
rm -rf *
cp -a ../topo-regions/website/. .
git add * && git commit -a -m "new release" && git push origin gh-pages
cd .. && rm -rf gh-pages
cd topo-regions
