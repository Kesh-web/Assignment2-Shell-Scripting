#!user/bin/bash/env bash

packages=./packages.txt
if [[ ! -f $packages]] 
then 
    echo "Packages list $packages not found"
    exit 1
fi


for package in $(cat $packages);
do
    if pacman -Qs "package" > /dev/null;
    then
        echo "$package is already installed"
    else
        echo "installing $package"
        pacman -Syu --noconfirm "$package"
    fi
done

