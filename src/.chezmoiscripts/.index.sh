#!/bin/bash

set -eu

declare script_dir=$PWD/$(dirname "$0")

file_list=(
  ".install-password-manager.sh",
  ".install-homebrew.sh"
  )

for file in "${file_list[@]}"; do
  if [ ! -f "$script_dir/$file" ]; then
    echo "Initial scripts - File: $file not found!"
    exit 1
    else
      /bin/bash $script_dir/$file
  fi
done

# /bin/bash $script_dir/.install-password-manager.sh
# /bin/bash $script_dir/.install-homebrew.sh
