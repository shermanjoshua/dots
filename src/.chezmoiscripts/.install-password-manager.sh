#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type dcli >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install password-manager-binary on Darwin

    if [[ type brew >/dev/null ]]; then
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
    fi
    
    brew bundle install --global

    dcli sync
    dcli n DOTFILES_PRIVATE_KEY | ssh-add -

    # if we can't brew
    # curl https://github.com/Dashlane/dashlane-cli/releases/download/v6.2436.0/dcli-macos-arm64 "/usr/local/bin"
    # chmod +x dcli-macos-arm64

    ;;
Linux)
    # commands to install password-manager-binary on Linux
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
