#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type dcli >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install password-manager-binary on Darwin

    if [[ $(command -v brew) == "" ]]; then
      echo "installing homebrew..."
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
    fi
    
    brew bundle install --file="${HOME}/.local/share/chezmoi/src/Brewfile"

    dcli sync
    dcli n DOTFILES_PRIVATE_KEY | ssh-add -

    # Handling the upload of gpg keys here as well, so that they are available as soon as possible.
    gpgconf --kill gpg-agent
    gpg --import ~/.local/share/chezmoi/src/.keys/dotfiles.asc

    ;;
Linux)
    # commands to install password-manager-binary on Linux
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
