#!/usr/bin/env zsh
android-bby-debug(){
  # $1 (first argument) should be app name (e.g) com.xyz
  # $2 (second argument) should be app activity to launch com.xyz.android.HomeActivity
  adb shell am start -n $1/$2
}

adbReverse(){ 
  echo "adb reverse tcp:${1:=8081} tcp${2:=8081}"
}