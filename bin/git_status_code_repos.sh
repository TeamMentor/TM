#!/usr/bin/env bash

cd code

function git_Status() {
  echo -e "\n------------------- $1 ------------------- \n"
  cd $1
  git status
  cd ..
}
git_Status TM_Angular
git_Status TM_Flare
git_Status TM_GraphDB
git_Status TM_Jade
git_Status TM_Shared
git_Status TM_Static
git_Status TM_Website
git_Status ../config/SiteData_TM
git_Status ../data/Lib_UNO
git_Status ../data/Lib_UNO-json

cd ..
git_Status .
