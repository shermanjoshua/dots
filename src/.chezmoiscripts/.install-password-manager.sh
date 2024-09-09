#!{{ lookPath "bash" }}

# exit immediately if password-manager-binary is already in $PATH
type dcli >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)

    if [[ $(command -v brew) == "" ]]; then
      echo "installing homebrew..."
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
    fi
    
    brew bundle install --file ~/.local/share/chezmoi/src/Brewfile

    dcli sync
    dcli n DOTFILES_PRIVATE_KEY | ssh-add -

    ;;
Linux)
    # commands to install password-manager-binary on Linux
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
