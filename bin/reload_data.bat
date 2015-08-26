echo -e "\n---- reloading tm graph from Lib_Uno data ----\n\n"
echo -e "...deleting Lib_UNO-json files..."

cd ..\data\Lib_UNO-json

IF EXIST Articles_Html rmdir Articles_Html /s /q 
IF EXIST Graph_Data    rmdir Graph_Data /s /q 
IF EXIST Mappings      rmdir Mappings  /s /q 
IF EXIST Search_Data   rmdir Search_Data /s /q 
IF EXIST Library       rmdir Library /s /q 

cd ..\..
echo "...running tool-update-mappings.coffee..."
cd .\build\TM_4_0_JSON_Data\src

call..\node_modules\.bin\coffee.cmd tool-update-mappings.coffee

cd ..\..\..\

echo "...copy Graph_Data..."
echo "%dir%"
XCOPY .\data\Lib_UNO\__Graph_Data\*.* .\data\Lib_UNO-json\Graph_Data /Y /E

cd .\code\TM_GraphDB\.tmCache
echo "%dir%"


SET FileToDelete="tm-uno-loaded.flag"

echo "... deleting tm-uno-loaded.flag if exist..."
IF EXIST %FileToDelete% del /F %FileToDelete%

echo "... deleting cache files..."

IF EXIST data_cache rmdir /s /q data_cache
IF EXIST search_cache rmdir /s /q search_cache

cd ..\..\..\
echo "... restarting TM..."
"c:\Program Files (x86)\Git\bin\sh.exe" -login -c "./bin/winTM.sh stop"
"c:\Program Files (x86)\Git\bin\sh.exe" -login -c "./bin/winTM.sh start"


echo "... Data has been published\n\n"
echo "... all done, you can restart the node server now"