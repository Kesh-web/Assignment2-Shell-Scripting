# Assignment-2-Shell-Scripting

## Introduction

This repository contains two Bash scripts developed to automate essential system administration tasks. The scripts streamline the processes of system setup and user management in a Unix-based environment, adhering to Bash scripting best practices.

## Project 1: Configuration Scripts

The first project involves creating scripts to automate the initial setup of your system. You'll write a script to install necessary software packages, set up configuration files, and create symbolic links.

## Project 2: New User Script

The second project focuses on creating a user management script. This script will automate the process of adding new users, setting passwords, assigning appropriate groups, and configuring user environments.

---

# Package Installer Script

This script (`setup`) installs packages listed in a text file using the Arch Linux package manager `pacman`.

## Requirements

- Ensure you're running Arch Linux or a compatible system with `pacman` as the package manager.
- Ensure that you have a file named `install-packages.txt` in the same directory as the `setup` script. This file should list the names of packages to install, each on a new line.

## Usage Instructions

1. **Run the Script**

   Open a terminal, navigate to the directory containing the `setup` script, and make the script executable (if it’s not already):

   ```bash
   chmod +x setup
   ```

2. Type ./setup
 to run the script.


**Notes**

The script uses the following `pacman` command:

- `pacman -Syu --noconfirm`: This command updates the package database, upgrades the system, and installs each package without asking for confirmation.



# Config-Script

This script (`config-script`) provides a convenient way to run specific setup tasks based on the options selected. It includes options to run the symbolic link setup script, the main package installation script, or both.

## Usage

To run the script, use the following command in the terminal:


./config-script [OPTIONS]


Options

    -h, --help: Display help information for using the script.
    -s, --symlink: Run the symbolic link setup script (config_symlink.sh) only.
    -x, --execute: Run both the main installation script (setup) and the symbolic link setup script.
    -p, --packages: Run the main installation script (setup) only.


Example Commands

    Display Help

    To view the help message with available options:

./config-script -h

Run the Symbolic Link Setup Script Only

To run only the symbolic link setup script (config_symlink.sh):

./config-script -s

Run the Main Installation Script Only

To run only the main installation script (setup):

./config-script -p

