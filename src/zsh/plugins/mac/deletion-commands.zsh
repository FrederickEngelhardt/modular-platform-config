
move-to-trash(){
  if [ -z "$1" ];
  then
    printf no argument provided
    return
  fi

  local TRASH_DIR=$HOME/.Trash

  if [ ! -d "$TRASH_DIR" ];
  then
    printf TrashDir does not exist. value: $TRASH_DIR
    return
  fi

  local today=`date '+%Y_%m_%d__%H_%M_%S'`;
  local TRASH_FILE_LOCATION="$TRASH_DIR/$1_$today"
  
  mv "$1" "$TRASH_FILE_LOCATION"

  # # if DIR or File and the second argument is provided and is equal to -d, then background delete the file from the trash 
  # if [ [ [ -d $TRASH_FILE_LOCATION ] || [ -f $TRASH_FILE_LOCATION ] ] && [ -z "$2" ] && [ $2 == "-d" ]];
  # then
  #   printf Deleting $TRASH_FILE_LOCATION
  #   rm -rf $TRASH_FILE_LOCATION &
  # fi
}

alias mtt="move-to-trash"

alias nmtt="move-to-trash node_modules"