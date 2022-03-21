#!/usr/bin/env bash
set -eu

# Arch Linux Install Script (alis) installs unattended, automated
# and customized Arch Linux system.
# Copyright (C) 2022 picodotdev

GITHUB_USER="FoxGitHub2021"
BRANCH="FoxCustom"

while getopts "u:" arg; do
  case ${arg} in
    u)
      GITHUB_USER=${OPTARG}
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

set -o xtrace
curl -sL -o "alis-$BRANCH.zip" https://github.com/$GITHUB_USER/alis/archive/refs/heads/$BRANCH.zip
bsdtar -x -f "alis-$BRANCH.zip"
cp -R alis-$BRANCH/*.sh alis-$BRANCH/*.conf alis-$BRANCH/files/ alis-$BRANCH/configs/ ./
chmod +x configs/*.sh
chmod +x *.sh

rm -f bashrc
rm -f lightdm.conf
rm -f 13.json
rm -f x11vnc.service

curl -O https://raw.githubusercontent.com/$GITHUB_USER/alis/$BRANCH/bashrc
curl -O https://raw.githubusercontent.com/$GITHUB_USER/alis/$BRANCH/lightdm.conf
curl -O https://raw.githubusercontent.com/$GITHUB_USER/alis/$BRANCH/13.json
curl -O https://raw.githubusercontent.com/$GITHUB_USER/alis/$BRANCH/x11vnc.service
curl -O https://raw.githubusercontent.com/$GITHUB_USER/alis/$BRANCH/extract-here.nemo_action
