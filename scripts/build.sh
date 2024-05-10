#!/bin/sh

enviroment=$1
extension=$2

set -e # exit immediately if a command exits with a non-zero status


cd ./android
./gradlew clean 


if [ $extension = "apk" ]
then
    echo -e "Will now run:\n ./gradlew assemble"$enviroment"Release"
    ./gradlew assemble"$enviroment"Release
    cp  app/build/outputs/apk/"$enviroment"/release/app-"$enviroment"-release.apk ../output/app-"$enviroment"-release.apk
else
    echo -e "Will now run:\n ./gradlew bundle"$enviroment"Release"
    ./gradlew bundle"$enviroment"Release
    cp  app/build/outputs/bundle/"$enviroment"Release/app-"$enviroment"-release.aab ../output/app-"$enviroment"-release.aab
fi

