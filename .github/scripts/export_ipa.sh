#!/bin/bash

set -eo pipefail

xcodebuild  -archivePath $PWD/build/Demo.xcarchive \
            -exportOptionsPlist exportOptions.plist \
             -exportPath "$XC_EXPORT_PATH"
            -allowProvisioningUpdates \
            -exportArchive -archivePath "$XC_ARCHIVE_PATH"
           
