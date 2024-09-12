#!/bin/bash

set -eu

type dcli >/dev/null 2>&1 && exit

case "$(uname -s)" in
  Darwin)

    echo "installing dashlane cli and syncing..."

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
