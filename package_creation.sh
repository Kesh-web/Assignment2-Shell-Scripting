#!user/bin/bash/env bash

# This shows the path to the txt file that contains the list of packages that will be installed. (kakoune and tmux)
packages=./packages.txt

# Checks if the package file exists. If it doesnt exist then print the error message and exit the script with the exit code 1 to indicate the error.
if [[ ! -f $packages]]; then 
    echo "Packages list $packages not found" 
    exit 1
fi


for package in $(cat $packages); # Loops through the packages listed in the txt file.
do
    if pacman -Qs "package" > /dev/null; # pacman -Qs checks if the package is already installed. If it is installed then it will return 0 which indicates success and throws the output into /dev/null which is like a garbage bin.
    then
        echo "$package is already installed" # If the file exists then it output the following.
    else
        echo "installing $package" # If it doesnt exist then this echos its being installed.
        pacman -Syu --noconfirm "$package" # Installs the package using pacman. --noconfirm doesnt ask for confirmation. -Syu does a system update.
    fi
done

