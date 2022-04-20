#!/bin/bash

set -eo pipefail

xcodebuild  -archivePath DerivedData/Archive/Demo.xcarchive \
            -exportOptionsPlist exportOptions.plist \
            -exportPath .github/Demo.ipa \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
           
