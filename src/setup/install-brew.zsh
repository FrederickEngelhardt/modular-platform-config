if ! [[ -n "$(command -v brew)" ]]; then
    echo "running brew install"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "running step 2: brew install"
    # adds brew to zprofile for apple silicon
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
    # adds brew to the current shell instance
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
