### remake html using sphinx 
make clean
make html

### add in custom html for image headers. sure there's a better way to do this, but this works.
./insert_imagebanners_html.sh

### copy files to where github pages expects them to be
cp media/* _build/html/_images
cp -r _build/html/* docs/
