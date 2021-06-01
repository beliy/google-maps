#!/bin/sh
##

AVAILABLE_VERSIONS=("3.10.0" "4.0.0" "4.1.0" "4.2.0" "5.0.0")
GOOGLE_MAPS_SDK=("GoogleMaps" "GoogleMapsBase" "GoogleMapsCore" "GoogleMapsM4B")
GOOGLE_PLACES_SDK=("GooglePlaces")

for version in ${AVAILABLE_VERSIONS[*]}
do
    for framework in ${GOOGLE_MAPS_SDK[*]}
    do
        curl -OL "https://github.com/YAtechnologies/GoogleMaps-SP/releases/download/${version}/${framework}.xcframework.zip"
        unzip "${framework}.xcframework.zip"
        rm "${framework}.xcframework.zip"
    done

    zip -r "GoogleMaps-${version}.zip" *.xcframework
    rm -r *.xcframework
done