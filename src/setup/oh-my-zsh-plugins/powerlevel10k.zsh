cloneTarget=$MPC_CONFIG_LIBS/powerlevel10k

installFonts(){
    # Install the fonts manually and trigger fontBook
    FONT_NAME="MesloLGS\ NF\ Regular.ttf"
    curl -L "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf" --output $HOME/Downloads/$FONT_NAME
    open -b com.apple.FontBook $HOME/Downloads/$FONT_NAME
}

if [[ ! -d "$cloneTarget" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $cloneTarget
    installFonts
fi

# To link with oh-my-zsh this will need to be symlinked into the plugins section