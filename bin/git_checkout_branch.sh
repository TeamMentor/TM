#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo -e "\nError: You must provide the name of the branch to checkout, for example: git_checkout_branch Dev\n"
  echo "Available branches"
  git  branch
  exit 1
fi

cd code
git checkout $1
git submodule update

function pull_Repo() {
  echo -------------------------------------------------
  echo Checking branch $1 on repo $2
  cd $2
  git checkout $1
  cd ..
}
pull_Repo $1 TM_Flare
pull_Repo $1 TM_GraphDB
pull_Repo $1 TM_Jade
pull_Repo $1 TM_Shared
pull_Repo $1 TM_Static
pull_Repo $1 TM_Website

cd ../config
pull_Repo $1 SiteData_TM