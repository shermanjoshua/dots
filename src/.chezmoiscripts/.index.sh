#!/bin/bash

set -eu

declare script_dir=$PWD/$(dirname "$0")

for file in $(find "$script_dir" -type f -name ".*"); do
  if [[ ! "$file" == *"index.sh" ]]; then
    /bin/bash $file
  fi
done
