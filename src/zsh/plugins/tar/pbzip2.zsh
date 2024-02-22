# #!/usr/bin/env zsh

export DEFAULT_TMPDIR=$TMPDIR

local-tmp-dir(){
  case $1 in
  set)
    TMPDIR=$HOME/workspaces/.cache
  ;;
  unset)
    $TMPDIR=$DEFAULT_TMPDIR
  ;;
  esac
}

tar(){  
  if [ $(command -v pbzip2 ) ]; then
    command pbzip2 -dkv file.tbz | tar $1 $2.out $3 $4 ${5:@}
    else
    command tar $@
  fi
}