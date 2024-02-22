# Windows Config
source ~/paths.zsh

# Homebrew WSL
# Any dependencies related to brew need to be referenced after
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# ssh-agent does not play nicely across shell instances utilize keychain to save keys and register ssh ids
source $MPC_ZSH_PLUGINS/keychain.zsh

if [[ $SAVED_PWD != $PWD  ]]
then
  cd $SAVED_PWD
fi

setCWD(){
  echo export SAVED_PWD=\"$(pwd)\" > ~/paths.zsh
}

export WINDOWS_USERNAME="fre19"

# Terminal start in same window workaround

# Alias explore to act similar to open command in macOS
alias open="explorer.exe"

# Drive Navigation Aliases
alias C="cd /mnt/c"

# Quick CD into a windows project
alias indeX360="cd \"/mnt/c/Users/fre19/Documents/INDEX XBOX EMULATION - IndeX360\""

# JAVA
# Windows file
# export JAVA_HOME="/mnt/c/Program\ Files/Java/jre1.8.0_261/bin/"
# Brew installed jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JAVA_11_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
# alias java="java.exe"

# Experimental
# export ANDROID_SDK_ROOT=/mnt/c/Users/$WINDOWS_USERNAME/AppData/Local/Android/Sdk
# # Android SDK
# export ANDROID_SDK=/mnt/c/Users/$WINDOWS_USERNAME/AppData/Local/Android/Sdk
# export PATH=$PATH:$ANDROID_SDK/emulator
# export PATH=$PATH:$ANDROID_SDK/tools
# export PATH=$PATH:$ANDROID_SDK/tools/bin
# export PATH=$PATH:$ANDROID_SDK/platform-tools

# Requires both WSL Path for WSL apps to compile in linux environment and Windows path for emulator to run through windows drivers

export ANDROID_HOME=/home/fengelhardt/Android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

export WIN_ANDROID_PATH=/mnt/c/Users/$WINDOWS_USERNAME/AppData/Local/Android/Sdk
export PATH=$PATH:$WIN_ANDROID_PATH/platform-tools
export PATH=$PATH:$WIN_ANDROID_PATH/emulator
alias adb="adb.exe"

# Simplify Executable command similar to macOSX and fix CMD.exe UNC path issue
alias em="cd /mnt/c; emulator.exe"
alias emulator="emulator.exe"

alias pixel2="emulator -avd Pixel_2_XL_API_30"

# Fix for React Native WSL hosting
export WSL_HOST_IP="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
export ADB_SERVER_SOCKET=tcp:$WSL_HOST_IP:5037

# Yarn Path
# curl -o- -L https://yarnpkg.com/install.sh | bash
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Neo4j
export PATH="$HOME/external-binaries/cypher-shell:$PATH"

cypher(){
  JAVA_HOME=$JAVA_11_HOME;
  cypher-shell
}

# Execution policies
# Open Powershell in administrative mode
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.1
# Example commands `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` allows for execution of .ps1 files


# Possible way to share windows ENV variables across WSL
# https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/
