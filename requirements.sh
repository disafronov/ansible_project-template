#!/usr/bin/env bash

set -e

# This throws an error with error message
die () {
  test -n "$1" && echo "$1" || echo "Error (no message specified)!"
  exit 1
}

# SH

if [ -s collections/requirements.sh ]; then
  echo "Detected: collections/requirements.sh"
  OLD_PWD="$(pwd)"
  cd collections/
  bash ./requirements.sh || die "cound not download collections add-ins"
  cd "${OLD_PWD}"
fi

if [ -s roles/requirements.sh ]; then
  echo "Detected: roles/requirements.sh"
  OLD_PWD="$(pwd)"
  cd roles/
  bash ./requirements.sh || die "cound not download roles add-ins"
  cd "${OLD_PWD}"
fi

# YML

if [ -s collections/requirements.yml ]; then
  echo "Detected: collections/requirements.yml"
  ansible-galaxy install -r collections/requirements.yml || die "cound not install collections"
fi

if [ -s roles/requirements.yml ]; then
  echo "Detected: roles/requirements.yml"
  ansible-galaxy install -r roles/requirements.yml || die "cound not install roles"
fi
