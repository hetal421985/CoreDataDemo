#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="4Hetal_Mehta" --output ./.github/secrets/SmartFlow_Vebuin_Development.mobileprovision  ./.github/secrets/SmartFlow_Vebuin_Development.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="4Hetal_Mehta" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/SmartFlow_Vebuin_Development.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/SmartFlow_Vebuin_Development.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
