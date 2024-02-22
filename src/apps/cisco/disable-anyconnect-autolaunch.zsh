#!/bin/zsh

LOCAL_AUTH=$HOME/workspaces/repos/bby-fengelhardt-local-config/src/zsh/__local__auth.zsh
source $LOCAL_AUTH

credential_keychain=$ANYCONNECT_CREDENTIAL_KEYCHAIN
account_id=$ANYCONNECT_USER_ID

get-credential(){
    security find-generic-password -w -s $credential_keychain -a $account_id
}

disable-anyconnect-autolaunch(){
  PLIST_TO_MOVE="com.cisco.anyconnect.gui.plist"
  if [ ! -d $DIR_ROOT/cisco_backups ]; then
    mkdir $DIR_ROOT/cisco_backups
    elif [ -f $DIR_ROOT/cisco_backups/$PLIST_TO_MOVE ]; then
      printf "File $PLIST_TO_MOVE already exists, you must manually delete the backed up file"
      return
  fi

  get-credential | sudo -S mv /Library/LaunchAgents/$PLIST_TO_MOVE $DIR_ROOT/cisco_backups/$PLIST_TO_MOVE
}