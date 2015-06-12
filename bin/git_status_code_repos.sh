#!/usr/bin/env bash

cd code
git fetch origin

function fetch_Repo() {
  echo -e "\n------------------- $1 ------------------- \n"
  cd $1
  git status
  cd ..
}
fetch_Repo TM_Flare
fetch_Repo TM_GraphDB
fetch_Repo TM_Jade
fetch_Repo TM_Shared
fetch_Repo TM_Static
fetch_Repo TM_Website