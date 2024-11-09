# Assignment-2-Shell-Scripting

## Table of Contents

1. [Introduction](#introduction)  
2. [Projects](#projects)  
   - [Configuration Scripts](#project-1-configuration-scripts)  
   - [New User Script](#project-2-new-user-script)  
3. [Package Installer Script](#package-installer-script)  
   - [Requirements](#requirements)  
   - [Usage Instructions](#usage-instructions)  
   - [Notes](#notes)  
4. [Config-Script](#config-script)  
   - [Usage](#usage)  
   - [Options](#options)  
   - [Example Commands](#example-commands)  
5. [Config Symlink Script](#config-symlink-script-documentation)  
   - [Overview](#overview)  
   - [Functions](#functions)  
     - [create-directory()](#create-directory)  
     - [create-symlink()](#create-symlink)  
   - [Home Directory Detection](#home-directory-detection)  
6. [User Creation Script](#user-creation-script)  
   - [Overview](#overview-1)  
   - [Features](#features)  
   - [Script Flow](#script-flow)  
7. [Documentation Links](#documentation-links)  
   - [Bash & Shell Scripting](#bash--shell-scripting)  
   - [Package Management](#package-management)  
   - [System Tools](#system-tools)  
   - [Shell Configuration](#shell-configuration)  
   - [UID and GID](#uid-and-gid)  
   - [Commands](#commands)  
   - [Additional References](#additional-references)

## Introduction

This repository contains two Bash scripts developed to automate essential system administration tasks. The scripts streamline the processes of system setup and user management in a Unix-based environment, adhering to Bash scripting best practices.

## Project 1: Configuration Scripts

The first project involves creating scripts to automate the initial setup of your system. You'll write a script to install necessary software packages, set up configuration files, and create symbolic links.

## Project 2: New User Script

The second project focuses on creating a user management script. This script will automate the process of adding new users, setting passwords, assigning appropriate groups, and configuring user environments.

---
<br>
<br>

<br>

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


<br>
<br>
<br>




# Config-Script

This script (`config-script`) provides a convenient way to run specific setup tasks based on the options selected. It includes options to run the symbolic link setup script, the main package installation script, or both.

## Usage

To run the script, use the following command in the terminal:

```bash
./config-script [OPTIONS]
```

## Options

    -h, --help: Display help information for using the script.
    -s, --symlink: Run the symbolic link setup script (config_symlink.sh) only.
    -x, --execute: Run both the main installation script (setup) and the symbolic link setup script.
    -p, --packages: Run the main installation script (setup) only.


## Example Commands

### Display Help

To view the help message with available options:

```./config-script -h ```
Run the Symbolic Link Setup Script Only

To run only the symbolic link setup script (config_symlink):

``` ./config-script -s ```

Run the Main Installation Script Only

To run only the main installation script (setup):

```./config-script -p ```
<br>

<br>

<br>

# Config Symlink Script Documentation

## Overview
This script automates the creation of directories and symbolic links for system configuration files.

## Script Details
**Filename:** `config_symlink`
## Usage 
To run the script, use the following command in the terminal:

```./config_symlink ```

## Functions

### create-directory()
Creates directories if they don't exist.

```bash
create-directory() {
   local dir_path=$1
   if [ ! -d "$dir_path" ]; then
       mkdir -p "$dir_path" && echo "Directory $dir_path created" || echo "Failed to create directory $dir_path"
   else
       echo "Directory $dir_path already exists"
   fi
}
```

### create-symlink()
Creates symbolic links if they don't exist.

```bash
create-symlink() {
    local target=$1
    local link_name=$2
    if [ -L "$link_name" ]; then
        echo "Symlink $link_name already exists"
    else
        ln -s "$target" "$link_name" && echo "Symlink $link_name created" || echo "Failed to create symlink $link_name"
    fi
}
```


### Home Directory Detection
The script determines the user's home directory based on the following conditions:

- Checks if running with sudo
- Checks if running as root
- Falls back to current user's home directory

```bash if [ "$SUDO_USER" ]; then
    USER_HOME="/home/$SUDO_USER"
elif [ "$EUID" -eq 0 ]; then
    USER_HOME="/root"
else
    USER_HOME="$HOME"
fi
```
<br>

<br>

<br>


#  User Creation Script

## Overview
With this script, you can specify options like user ID (UID), shell, home directory, and additional groups for a new user. Since this script modifies system files such as `/etc/passwd` and `/etc/group`, it requires root or superuser privileges to run.



## Features
- **Customizable Options**:
  - **User ID (UID)**: Specify a custom UID for the new user.
  - **Shell**: Define a specific shell for the user (defaults to `/bin/bash`).
  - **Home Directory**: Set a custom home directory path.
  - **Groups**: Assign the user to additional groups (groups will be created if they do not already exist).
- **Automated Home Directory Creation**: Creates the user’s home directory with proper permissions.
- **Password Setting**: Prompts to set a password for the new user.


## Script Flow

1. **Check for User Privileges**: 
   - Ensures the script can be run without root access but requires the necessary user privileges to modify system files (`/etc/passwd`, `/etc/group`).

2. **Parse Arguments**: 
   - Processes command-line options such as UID, shell, home directory, and groups.

3. **Create User**:
   - Adds the new user to `/etc/passwd`.
   - Creates the specified home directory with correct permissions.
   - Adds the user to specified groups, creating any missing groups as necessary.

4. **Set Password**: 
   - Prompts to set a password for the new user.

---

> **Note**: Always review and confirm user creation details, as creating users and modifying groups can have significant effects on system access and security.


<br>

<br>

<br>

## References

### Bash & Shell Scripting
- [Bash Manual](https://www.gnu.org/software/bash/manual/bash.html) - Official GNU Bash documentation.
- [Advanced Bash Guide](https://tldp.org/LDP/abs/html/) - Comprehensive guide to Bash scripting.
- [Working with Options](https://learning.oreilly.com/videos/bash-shell-scripting/9780137689064/9780137689064-BSS2_04_10_01/) - Oreilly - Working with Options.

### Package Management
- [Arch Linux Pacman](https://wiki.archlinux.org/title/pacman) - Official documentation for the pacman package manager.

### System Tools
- [GNU Coreutils](https://www.gnu.org/software/coreutils/manual/) - Documentation for basic file operations (e.g., `mkdir`, `ln`).
- [tmux Wiki](https://github.com/tmux/tmux/wiki) - tmux configuration and usage guide.
- [Kakoune Editor](https://github.com/mawww/kakoune/blob/master/README.asciidoc) - Setup guide for the Kakoune editor.

### Shell Configuration  
- [Bash Startup Files](https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html) - Documentation for `.bashrc` setup.
- [Linux Filesystem Hierarchy](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/) - Guide to Linux directory structure.

### UID and GID
- [Difference Between UID and EUID](https://medium.com/@althubianymalek/uid-and-gid-in-executing-a-binary-120e2f67d317) - Explanation of UID and EUID.

### Commands
- [Primary Expressions with `if` Statements](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html) - Working with `if` statements in Bash.

### Additional References
- [Linux `passwd` Command](https://man7.org/linux/man-pages/man1/passwd.1.html) - Man page for the `passwd` command, used for changing user passwords in Linux systems.
- [Linux `groupadd` Command](https://man7.org/linux/man-pages/man8/groupadd.8.html) - Man page for the `groupadd` command, used for creating new groups in Linux systems.
