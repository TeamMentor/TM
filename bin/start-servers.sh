#!/bin/bash

export TM_SITE_DATA=SiteData_TM_4

echo Setting SiteData to ${siteData}

echo Starting TM_Website
cd  code/TM_Website
#npm start &\
node app.js &
cd ../..

#echo Starting TM_4_0_GraphDB
#cd   code/TM_4_0_GraphDB
##npm run dev &
#node index.js  &
#cd   ../..

wait
