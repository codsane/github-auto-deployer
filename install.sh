#!/bin/bash

# Get install script dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
DESTINATION_DIR=~/.github-auto-deployer;

if [ -d $DESTINATION_DIR ]
then
    echo -n "Directory $DESTINATION_DIR already exists. Are you sure you want to delete it and re-install? [Y/n]  ";
    read response;
    
    if [ $response = "Y" ] || [ $response = "y" ]
    then
        rm -r $DESTINATION_DIR;
    else
        exit;
    fi;
fi;


mkdir $DESTINATION_DIR &&

cd $SCRIPT_DIR &&
cp app.conf $DESTINATION_DIR &&
cp start.sh $DESTINATION_DIR &&
cp index.js $DESTINATION_DIR &&
cp yarn.lock $DESTINATION_DIR &&
cp index.html $DESTINATION_DIR &&
cp package.json $DESTINATION_DIR &&
cp deployment.yml $DESTINATION_DIR &&

cd $DESTINATION_DIR &&

yarn install &&
yarn global add pm2 &&

echo "**************Installation completed**************";