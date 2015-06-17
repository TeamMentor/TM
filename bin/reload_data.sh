#!/usr/bin/env bash

echo -e "\n---- reloading tm graph from Lib_Uno data ----\n"

echo "... rebuilding json files"

cd build/TM_4_0_JSON_Data

./src/tool-update-mappings.coffee

cd ../..

cd code/TM_GraphDB/.tmCache
rm tm-uno-loaded.flag

echo "... deleting cache files..."
rm -R data_cache
echo "... all done, you can restart the node server now"
cd ..
pwd
