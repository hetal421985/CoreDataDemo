#!/bin/bash

set -eo pipefail

xcodebuild -project Demo.xcodeproj \
            -scheme Demo \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/Calculator.xcarchive \
            clean archive | xcpretty
