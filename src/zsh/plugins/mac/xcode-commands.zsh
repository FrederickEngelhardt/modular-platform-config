#!/usr/bin/env zsh
# Xcode Commands

# opens xcode workspace
# useful for react-native-development
xcwo(){
  echo "opening nearest .xcodeworkspace dir within 2 levels";

  (test -d ./*.xcworkspace && open ./*.xcworkspace) || (test -d ./ios/*.xcworkspace && open ./ios/*.xcworkspace)
}

# helps fix issues with builds
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'