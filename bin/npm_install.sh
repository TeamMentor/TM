#!/usr/bin/env bash

git submodule init
git submodule update

cd code

cd TM_Website
npm install
cd

pwd