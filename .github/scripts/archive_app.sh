#!/bin/bash

set -eo pipefail

xcodebuild -project Demo.xcodeproj \
            -scheme Demo \
            -sdk iphoneos \
            -archivePath  DerivedData/Archive/Demo.xcarchive \
            clean archive | xcpretty
