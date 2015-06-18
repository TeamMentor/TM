#!/bin/bash

#export TM_SITE_DATA=SiteData_TM

echo [bash] Starting TM_Website
cd  code/TM_Website
npm start &
#node app.js &
cd ../..

echo [bash]Starting TM_4_0_GraphDB
cd   code/TM_GraphDB
npm run dev &
#node index.js  &
cd   ../..

wait
