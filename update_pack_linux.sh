#!/bin/bash/
# Installs git by checking for apt-get or yum
installgit() {
    yum install git-core
    if [ ! $? -eq 0 ]; then 
        apt-get update
        apt-get install git-all
        if [ ! $? -eq 0 ]; then
            echo "Failed to install git."
            echo "Please download manually from https://git-scm.com/"
            exit 1;
        fi
    fi   
}

# Checks out if there if no .git information
checkoutrepo() {
    git clone git@github.com:Hallo89/Dandelion-With-Mods.git .
    if [ ! $? -eq 0 ]; then
        echo "An error occured during clone".
        exit 1
    fi
}

updatelocal() {
    git reset --hard
    git pull origin master
}

# Running git --version to check whether git is installed
git --version

# Check for error code
if [ ! $? -eq 0 ]; then
    echo "You do not have git installed!"
    echo "You need git to download this update!"
    while true; do
        read -p "Want to install it? (Y/N)" yn
        case $yn in 
          [Yy]* ) installgit; break;;
          [Nn]* ) echo "If you dont want to"; exit 1;;
          * ) echo "Please answer (Y/N)";;
         esac          
    done
fi

# Check current repo
git remote show origin
if [ ! $? -eq  ]; then 
    echo "This isn't registered as git repository."
    while true; do
        read -p "Clone anyway? (Y/N) " yn
        case $yn in
          [Yy]* ) checkoutrepo; break;;
          [Nn]* ) echo "If you dont want to"; exit 1;;
          * ) echo "Please answer (Y/N)";;
        esac          
    done
fi

# No errors or pitfalls detected
updatelocal
