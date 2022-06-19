#!/usr/bin/env bash

########################################################
# Bash script to install git on MacOS
# Written by Jafet Granados | jafet.granados@outlook.com
########################################################

zshWhichVariant="not found"

### TODO: Parameterize with flags
### TODO: Reinstall git if it is already instaled using flag --force
### TODO: Compare current version with last version of git and notify to the user that it can be re-run with flag --upgrade
### TODO: Receive a flag to upgrade git to the last version

gitLocation=$(which git)
if [[ !(-z $gitLocation) && $gitLocation != *"$zshWhichVariant"* ]]; then
    gitVersion=$(git --version)

    echo "$gitVersion already installed. You can re-run this scrip with -f flag to reinstall it."
    exit 0
fi

### TODO: If brew does not exist, install by another way
brewLocation=$(which brew)
if [[ -z $brewLocation || $brewLocation == *"$zshWhichVariant"* ]]; then
    echo "INFO: You need to install brew first in order to install git."
    exit 0
fi

brew install git
echo "Git was intalled correctly, go ahead and configure it!"