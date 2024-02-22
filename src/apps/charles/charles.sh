#!/usr/bin/bash

charles-install-ios(){
  set -e
  OUTFILE="zscaler-root-export.pem"

  security find-certificate -p -c "Zscaler Root CA" > "$OUTFILE"

  xcrun simctl keychain booted add-root-cert "$OUTFILE"
}