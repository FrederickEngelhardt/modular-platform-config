# TODO make this a commander cli in typescript
#   - ship a node_js binary in releases to make the first install zero dependency

# Gets the v1 tags, sorts them, and gets the latest
get_latest_tag(){
  git describe --match "v*" --abbrev=0 --tags $(git rev-list --tags --max-count=1)
}

# providing a false parameter (e.g) ./run-sync.zsh false will use the main branch
is_tag_sync=${1:-true}
# providing the second parameter as a string will target a specific branch such as main1
# (e.g) ./run-sync.zsh false main1 will sync the github branch main1
selected_branch=${2:-"main"}
has_stash=false
should_unstash=false

if [ "$is_tag_sync" = true ]; 
then
  git fetch --tags;
  selected_branch=$(get_latest_tag)
  echo "LATEST TAG $selected_branch"
else
  git fetch origin $selected_branch;
fi


git diff-index --quiet HEAD -- || {
  echo "untracked filea detected, stashing them";
  git stash push ./ -m "run-sync: untracked files"
  has_stash=true

  [ $(git branch --show-current) = "$selected_branch" ] && {
    should_unstash=true
  }
}

echo "Checking out selected_branch: $selected_branch"
git checkout $selected_branch
echo "running setup"

./run-setup.zsh

[ "$has_stash" = true ] && [ "$should_unstash" = true ] && {
  git stash pop
}