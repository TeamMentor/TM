#!/usr/bin/env bash

echo -e "\n---- reloading tm graph from Lib_Uno data ----\n"

cd build/TM_4_0_JSON_Data

node ./node_modules/coffee-script/bin/coffee ./src/tool-update-mappings.coffee

cd ../..

cd code/TM_GraphDB/.tmCache
rm tm-uno-loaded.flag

echo "... deleting cache files..."
rm -R data_cache
echo "... all done, you can restart the node server now"
cd ..
pwd
