#!/bin/bash

set -eo pipefail

xcodebuild  -archivePath DerivedData/Archive/Demo.xcarchive \
            -exportOptionsPlist exportOptions.plist \
            -exportPath DerivedData/IPA \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
           
