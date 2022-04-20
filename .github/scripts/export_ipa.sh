#!/bin/bash

set -eo pipefail

xcodebuild  -archivePath DerivedData/Archive/Demo.xcarchive \
            -exportOptionsPlist exportOptions.plist \
            -exportPath ./artifacts/ \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
           
