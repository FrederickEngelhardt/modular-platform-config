#!/usr/bin/env zsh
# React Native
alias react-native="npx react-native"
alias rn='react-native'
alias rnios='rn run-ios'
alias rn-fix="killall node; rm -rf ./node_modules; watchman watch-del-all; rm -rf tmp/haste-map-react-native-packer; rm -fr $TMPDIR/react-*; yarn;"
alias rnra="react-native run-android"
alias rn-debug="adb shell input keyevent 82"
alias rnd="rn-debug"
alias crna="npx create-react-native-app"

# iOS bugfix
alias third-party-fix="rm -rf ~/.rncache;
                       cd node_modules/react-native;
                       rm -fr third-party;
                       scripts/ios-install-third-party.sh;
                       cd third-party/glog-0.3.5/
                       ./configure;
                       "
## Android comands found here src/zsh/plugins/android/android-adb.zsh