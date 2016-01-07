#!/usr/bin/env bash

if [[ -z $1 ]]; then
  echo -e "\nError: You must provide the name of the branch to checkout, for example: git_checkout_branch Dev\n"
  echo "Available branches"
  git  branch
  exit 1
fi

cd code
#git checkout $1
#git submodule update

function checkout_Branch() {
  echo -------------------------------------------------
  echo Checking branch $1 on repo $2
  cd $2
  git checkout $1
  cd ..
}
checkout_Branch $1 TM_Angular
checkout_Branch $1 TM_Flare
checkout_Branch $1 TM_GraphDB
checkout_Branch $1 TM_Jade
checkout_Branch $1 TM_Shared
checkout_Branch $1 TM_Static
checkout_Branch $1 TM_Website

cd ../config
checkout_Branch $1 SiteData_TM
cd ../qa
checkout_Branch $1 TM_QA
