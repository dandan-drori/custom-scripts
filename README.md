# Configuration Files
Custom scripts created mainly for automation of common tasks.
THIS PROJECT IS CURRENTLY IN BETA HENCE THERE IS NO RELEASE AVAILABLE YET.

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

## General info
This repo contains the custom scripts i use on a daily basis to automate common tasks such as creating a new project and downloading all the correct dependencies.
Please note that the shell scripts in this repo are currently only available for bash since they are writting in bash script.
We are currently working on converting the scripts into powershell script to make them available for Windows users as well.
THIS PROJECT IS CURRENTLY IN BETA HENCE THERE IS NO RELEASE AVAILABLE YET.

## Technologies
The scripts in this project are created with:
* Bash - 5.0.17(1)-release
* Vim - Vi IMproved 8.1 (2018 May 18, compiled Apr 15 2020 06:40:31)
* Vundle - Vim plugin manager - Version 0.10.2
	
## Setup
To run this project, fork the repository and clone it into your own machine:

```
$ git clone <repo-url>
```

Make sure to add this line to your .bashrc (or any shell configuration file):

```
$ export PATH=$PATH":$HOME/path/to/script"
```

And add this line to your .bash_aliases (or any shell aliases file):

```
$ alias createProject='projectCreate.sh' 
```

## Todos:
Convert projectCreate.sh to powershell script
Add React as a language option in projectCreate.sh
Add ReactNative as a language option in projectCreate.sh

### If you have any suggestions, please let us know!
#### Happy coding ;)
