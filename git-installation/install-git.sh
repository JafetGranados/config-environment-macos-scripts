#!/usr/bin/env bash

########################################################
# Bash script to install git on MacOS
# Written by Jafet Granados | jafet.granados@outlook.com
########################################################

zshWhichVariant="not found"

brewLocation=$(which brew)
if [[ -z $brewLocation || $brewLocation == *"$zshWhichVariant"* ]]; then
    echo "INFO: You need to install brew first in order to install git."
    exit 0
fi

gitLocation=$(which git)
if [[ !(-z $gitLocation) && $gitLocation != *"$zshWhichVariant"* ]]; then
    brew upgrade git
else
    brew install git
    echo "Git was intalled correctly, go ahead and configure it!"
fi