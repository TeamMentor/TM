#!/usr/bin/env bash

cd code
git fetch origin

function fetch_Repo() {
  echo Fetching repo: $1
  cd $1
  git fetch origin
  cd ..
}
fetch_Repo TM_Flare
fetch_Repo TM_GraphDB
fetch_Repo TM_Jade
fetch_Repo TM_Shared
fetch_Repo TM_Static
fetch_Repo TM_Website