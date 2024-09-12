#!/bin/bash

set -eu

type brew >/dev/null 2>&1 && exit

case "$(uname -s)" in
  Darwin)

    echo "installing homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
    brew bundle install --file=~/.local/share/chezmoi/src/Brewfile

    ;;
  Linux)
    # commands to install password-manager-binary on Linux
    ;;
  *)
    echo "unsupported OS"
    exit 1
    ;;
esac
