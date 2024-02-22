#!/bin/bash

MAXFILES_SOFT_LIMIT=1048576
MAXFILES_HARD_LIMIT=10485760

# MacOSX >= 10.6.x permanent fix
fix-max-files-permanently(){
  # do not enable this until the script is tested
  # local SYSTCTL_CONF=/etc/sysctl.conf
  local LIMIT_CONFIG_FILE=/Library/LaunchDaemons/limit.maxfiles.plist

  if [ ! -f $LIMIT_CONFIG_FILE ]; then
    sudo cp ./limit.maxfiles.plist $LIMIT_CONFIG_FILE
    sudo chown root:wheel $LIMIT_CONFIG_FILE
    else
      echo "$LIMIT_CONFIG_FILE already exists. This script will not override a pre-existing file."
  fi
}

fix-max-files-permanently

echo "adding a temp override for "
# sudo sysctl -w kern.maxfiles=10485760 && sudo sysctl -w kern.maxfilesperproc=$MAXFILES_SOFT_LIMIT
sudo launchctl limit maxfiles $MAXFILES_SOFT_LIMIT $MAXFILES_HARD_LIMIT