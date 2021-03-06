# Custom Scripts
Custom scripts created mainly for automation of common tasks.\
THIS PROJECT IS CURRENTLY IN BETA HENCE THERE IS NO RELEASE AVAILABLE YET.

## Table of contents
* [General Info](#general-info)
* [Technologies](#technologies)
* [Project Overview](#project-overview)
* [Setup](#setup)
* [Usage](#usage)
* [Todos](#todos)

## General Info
This repo contains the custom scripts i use on a daily basis to automate common tasks such as creating a new project and downloading all the correct dependencies.\
Please note that the shell scripts in this repo are currently only available for bash since they are writting in bash script.\
We are currently working on converting the scripts into powershell script to make them available for Windows users as well.\
THIS PROJECT IS CURRENTLY IN BETA HENCE THERE IS NO RELEASE AVAILABLE YET.

## Technologies
The scripts in this project are created with:
* Bash - 5.0.17(1)-release
* Vim - Vi IMproved 8.1 (2018 May 18, compiled Apr 15 2020 06:40:31)
* Vundle - Vim plugin manager - Version 0.10.2
	
## Project Overview:
This repo contains the following scripts:
1) projectCreate.sh - creates files with boilerplate code for project in a given language. 
currently supports React, Python, C, C++ and Java.
2) mdCreate.sh - creates a new markdown file with boilerplate text, meta data, tables and equations examples.
3) md2pdf.py - converts a markdown to pdf format using pandoc, and places it in appropriate folder.
4) opdf.py - opens the pdf version of the given markdown file.
5) mdDelete.py - deletes the pdf version of the given markdown file.

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

## Usage:
Simply open a command line tool or terminal (Windows users - search for "cmd" and press Enter), and type "createProject".\
Use with flag -h (createProject -h) to see help and usage guide.\
The program will prompt for a project name - enter your desired project name.\
The program will show a menu of different programming languages and ask you to choose one using the numbers listed next to each language name.\
The script will then run, creating the project directory in the current directory and create all of the needed files and dependencies inside of it.

## Todos:
1) ~~Add C as a language option in projectCreate.sh.~~
2) ~~Add React as a language option in projectCreate.sh~~
3) ~~Add option to name files that will be created by the script, and use the saved file names inside the files (includes).~~
4) Add ReactNative as a language option in projectCreate.sh
5) Add usage instructions to enable PowerShell scripts to be run using administrator and Set-ExecutionPolicy RemoteSigned.
6) Convert projectCreate.sh to powershell script
7) Create an install script to create a directory, save the powershell script in it and add its path to PATH. And create an alias for the script. 

### If you have any suggestions, please let us know!
#### Happy coding ;)
