#!/usr/bin/env zsh

install-cocoapods-nuke-extensions(){
  sudo gem install cocoapods-deintegrate cocoapods-clean
}

nuke-cocoapods(){
  rm -rf ~/Library/Caches/CocoaPods && rm -rf Pods && rm -rf ~/Library/Developer/Xcode/DerivedData/* && pod deintegrate && pod clean
}