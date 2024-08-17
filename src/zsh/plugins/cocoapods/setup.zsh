# Alternative to finding this path is to do a `gem list -d cocoapods$` to verify it actually exists

# Version of the path is based on minor version so 3.2.0 will match for 3.2.2
rubyVersion=$(rbenv version | egrep -o "([0-9]{1,}\.)+[0-9]{1,}")
rubyMajorMinor=$(echo $rubyVersion | egrep -o "[0-9].[0-9]")
currentGemFolder="$rubyMajorMinor.0"

export RBENV_GEM_PATH="$HOME/.local/share/gem/ruby/$currentGemFolder"
export PATH=$RBENV_GEM_PATH/bin:$PATH