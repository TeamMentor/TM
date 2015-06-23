echo -e "\n---- reloading tm graph from Lib_Uno data ----\n"

cd ../build/TM_4_0_JSON_Data/src

CALL coffee tool-update-mappings.coffee

cd ../../../

cd code/TM_GraphDB/.tmCache
echo "%dir%"
@REM File to be deleted
SET FileToDelete="tm-uno-loaded.flag"

echo "... deleting tm-uno-loaded.flag if exist..."
IF EXIST %FileToDelete% del /F %FileToDelete%

echo "... deleting cache files..."
IF EXIST data_cache rmdir data_cache /s /q
echo "... Data has been published"
cd ../../../bin/