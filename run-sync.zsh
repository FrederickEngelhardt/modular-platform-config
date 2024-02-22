git fetch;

CAN_UPDATE=true
HAS_STASH=false
git diff-index --quiet HEAD -- || {
  echo "untracked filea detected, stashing them";
  git stash push ./ -m "run-sync: untracked files"
  HAS_STASH=true
}


if HAS_STASH; then git stash pop