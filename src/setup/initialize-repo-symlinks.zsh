#!/usr/bin/env zsh

# symlink the entire repo to the root user for easy file access
    # Needs to be run in the root of this directory see symlink-repo script in package.json for where it is called
handleRepoLink(){
    local FOLDER=$MPC_CONFIG
    
    if test -d "$FOLDER"; then
        echo "$FOLDER exists. Removing FOLDER"
        rm $FOLDER
    fi

    echo "Initializing symlinks for entire repo"
    ln -s $(pwd) $FOLDER;

    if ! test -d "$FOLDER"; then
        echo $FOLDER does not exist
    fi
}

# Link .zshrc file
handleZshrcLink(){
    local FILE=$HOME/.zshrc

    if test -f "$FILE"; then
        echo "$FILE exists. Removing file"

        if test -f $HOME/.zshrc_pre_mapps_zsh; then
            rm $HOME/.zshrc_pre_mapps_zsh
        fi

        mv $FILE $HOME/.zshrc_pre_mapps_zsh
    fi

    echo "Initializing symlinks for .zshrc"
    ln -s $MPC_ZSHRC $HOME/.zshrc;

    # set .zshrc to read only preventing scripts from breaking it.
    chmod 444 $MPC_CONFIG/src/zsh/.zshrc
}

# required for oh-my-zsh-plugins to work
# @todo refactor this to run same logic with an array of plugins
handleOhMyZshPluginIntegration(){
    if test -d $MPC_CONFIG_LIBS/powerlevel10k; then 
        echo "Linking powerlevel10k install to oh-my-zsh custom theme folder"
        ln -s $MPC_CONFIG_LIBS/powerlevel10k $MPC_CONFIG_LIBS/oh-my-zsh/custom/themes/powerlevel10k
    fi 

    if test -d $MPC_CONFIG_LIBS/zsh-syntax-highlighting; then 
        echo "Linking oh-my-zsh-plugin: zsh-syntax-highlighting"
        ln -s $MPC_CONFIG_LIBS/zsh-syntax-highlighting $MPC_CONFIG_LIBS/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    fi 

    if test -d $MPC_CONFIG_LIBS/evalcache; then 
        echo "Linking oh-my-zsh-plugin: evalcache"
        ln -s $MPC_CONFIG_LIBS/evalcache $MPC_CONFIG_LIBS/oh-my-zsh/custom/plugins/evalcache
    fi
}