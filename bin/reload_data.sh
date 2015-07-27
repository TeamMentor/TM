#!/usr/bin/env bash


echo -e "\n---- reloading tm graph from Lib_Uno data ----\n\n"

echo "...deleting Lib_UNO-json files..."


cd data/Lib_UNO-json
rm -R ./Articles_Html
rm -R ./Graph_Data
rm -R ./Mappings
rm -R ./Search_Data
rm -R ./Library
cd ../..


echo "...running tool-update-mappings.coffee..."

cd build/TM_4_0_JSON_Data

node ./node_modules/coffee-script/bin/coffee ./src/tool-update-mappings.coffee

cd ../..

echo "...copy Graph_Data..."
cp -R data/Lib_UNO/__Graph_Data/* data/Lib_UNO-json/Graph_Data

cd code/TM_GraphDB/.tmCache
rm tm-uno-loaded.flag

echo "... deleting cache files..."
rm -R data_cache
echo "... all done, you can restart the node server now"
cd ..
pwd
