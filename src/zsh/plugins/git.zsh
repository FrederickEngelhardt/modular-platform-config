#!/usr/bin/env zsh
# Git
alias prune="git fetch -p"
alias gb-latest="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'
" # sorts git branches
alias gbn="git rev-parse --abbrev-ref HEAD"

gpn(){
  git push -u origin HEAD
}

alias git-prune-remove="git branch --list --format \"%(if:equals=[gone])%(upstream:track)%(then)%(refname:short)%(end)\" | xargs git branch -D"
alias gcan="git commit --amend --no-edit"

# Quick swap between git commit emails
gconfig(){
  git config user.name "Frederick Engelhardt";
  case $1 in
    virtualize)
      git config user.email "fre@virtualizellc.com";
    ;;
    *)
      git config user.email "fre@virtualizellc.com";
    ;;
  esac
  echo "Config: $1, Setting git configuration is now email: $(git config user.email) and name: $(git config user.name)";
}

if command -v git-up &> /dev/null;
  then
    alias gu="git-up";
fi

gpa(){
  for i in "${GIT_GPA_REMOTES[@]}"
  do
    git push $i $@
  done
}