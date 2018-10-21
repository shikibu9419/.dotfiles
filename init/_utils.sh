#!/bin/sh

set -e

DOT_TARBALL="https://github.com/shikibu9419/dotfiles/tarball/master"

has() {
  type "$1" > /dev/null 2>&1
}

notice() {
  echo "============================================================"
  echo $1
  echo "============================================================"
}

error_msg() {
  echo $1
  exit 1
}
