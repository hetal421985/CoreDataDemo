#!/bin/bash

set -eo pipefail

xcodebuild  -archivePath $PWD/build/Demo.xcarchive \
            -exportOptionsPlist exportOptions.plist \
              -exportPath /Demo/DemoIPA.ipa \
            -allowProvisioningUpdates \
            -exportArchive \
           
