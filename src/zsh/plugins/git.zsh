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
# TODO swap to JS/TS and make config get stored in a JSON object
# Passing the parameter of example_company will set the user email to a different email address
gconfig(){
  git config user.name $GIT_GLOBAL_USER;
  case $1 in
    example_company)
      git config user.email ${GIT_GLOBAL_USER_COMPANY_EMAIL};
    ;;
    *)
      git config user.email $GIT_GLOBAL_USER_PERSONAL_EMAIL;
    ;;
  esac
  echo "Config: $1, Setting git configuration is now email: $(git config user.email) and name: $(git config user.name)";
}

# Pushes to all remotes with the current branch name and passes arguments through
gpa(){
  for i in "${GIT_GPA_REMOTES[@]}"
  do
    git push $i $@
  done
}