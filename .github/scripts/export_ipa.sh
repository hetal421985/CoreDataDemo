#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/Demo.xcarchive \
            -exportOptionsPlist Demo/Demo/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
