#!/usr/bin/env bash

SCRIPT_DIR=$(readlink -f $(dirname $0))
BIN_DIR=$SCRIPT_DIR/bin
CURRENT_SHELL_PROFILE=~/.$(basename $SHELL)rc

if ! grep -q $SCRIPT_DIR $CURRENT_SHELL_PROFILE; then
  echo "[+] Adding bin path to $CURRENT_SHELL_PROFILE"
  echo "export PATH=$BIN_DIR:\$PATH" >> $CURRENT_SHELL_PROFILE
else
  echo "[+] Path already in $CURRENT_SHELL_PROFILE"
fi

if [ -f "$1" ]; then
  while IFS= read line
  do
    image_name=$(echo $line | cut -d\| -f1)
    options=$(echo $line | cut -d\| -f2)
    binary_name=$(echo $line | cut -d\| -f3)
    bin/create_binstub $image_name "$options" $binary_name    
  done < $1
fi

exec $SHELL
