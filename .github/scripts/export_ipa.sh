#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/Demo.xcarchive \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
