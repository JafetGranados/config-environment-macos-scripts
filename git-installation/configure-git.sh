#!/usr/bin/env bash

########################################################
# Bash script to configure an already installle git 
# git installation on MacOS
# Written by Jafet Granados | jafet.granados@outlook.com
########################################################

# The core.editor, difftool and mergetool must be configured 
# on the script that install the editor. (i.e. vscode)
# This ensures keep decoupled this script

gitLocation=$(which git)
zshWhichVariant="not found"
if [[ -z $gitLocation || $gitLocation == *"$zshWhichVariant"* ]]; then
    echo "There isn't any git installation. Please install it before."
    exit 0
fi

while getopts 'u:e:' OPTION; do
  case "$OPTION" in
    u)
        username="$OPTARG"
      ;;
    e)
        email="$OPTARG"
      ;;
    ?)
      echo "script usage: $(basename \$0) [-u username] [-e email]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

if [[ -z "$username" || -z "$email" ]]; then
    echo "You need to provide username and email: [-u username] [-e email]";
fi
 
git config --global user.name "$username"
git config --global user.email "$email"
git config --global alias.st "status -sb"
git config --global alias.co "checkout"
git config --global alias.cm "commit -m"
git config --global alias.hist "log --oneline --graph --decorate --color"
git config --global alias.last "log -1 HEAD --stat"
git config --global alias.gl 'config --global -l'
git config --global alias.ge 'config --global -e'
git config --global alias.unstage 'git restore --staged'

globalIgnoreFile=~/.gitignore_global
if [[ !(-f $globalIgnoreFile) ]]; then
  touch $globalIgnoreFile
  echo "*~" >> $globalIgnoreFile
  echo ".DS_Store" >> $globalIgnoreFile
  echo "=============== Global gitignore file ==============="
  cat $globalIgnoreFile
  git config --global core.excludesFile $globalIgnoreFile
fi

echo "================== Git config file =================="
git config --global -l
echo "====================================================="