#!/usr/bin/env bash

########################################################
# Bash script to install several tools on MacOs
# Written by Jafet Granados | jafet.granados@outlook.com
########################################################

### TODO: All script MUST be build decoupled. No one should depend on another.
userproperties="./user.properties"

function prop {
    grep "${1}" ${userproperties} | cut -d'=' -f2
}

# install git
./git-installation/install-git.s
./git-installation/configure-git.sh -u $(prop 'gitconfig.test.user') -e $(prop 'gitconfig.test.email')