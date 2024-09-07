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
    
    brew bundle install --global

    # This part if fucking stupid, but it is what it is right now....
    # Dashlane does NOT have CLI support for logging in without user 
    # interation. There is no silent mode or -y or anything. So when
    # the `sync` command runs, you'll have to copy the URL, open
    # something to use to hit that URL and do that, and then use the 
    # arrow keys to select the "email" option. Then you wait, copy the
    # code from the email, and manually paste it here. 🤦
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
