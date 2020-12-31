#!/bin/bash

normal=`echo -en "\e[0m"`
green=`echo -en "\e[32m"` 
red=`echo -en "\e[31m"`
underline=`echo -en "\e[4m"`
bold=`echo -en "\e[1m"`

function help(){
  echo "usage: projectCreate -l lang "
  echo "optional : -g intialise a git repo inside project folder"
  echo "         : -h show this help message"
  echo "         : -p projectName -c className -e executableName"
  echo "         : -v show current version"
}


git_init='false'

while getopts "l:hgvp:c:e:" flag; do
    case "${flag}" in
        g)
            git_init='true'
            ;;
        l)
            lang="${OPTARG}"
            ;;
        p)
            project_name="${OPTARG}"
            ;;
        c)
            class_name="${OPTARG}"
            ;;
        e)
            exe_name="${OPTARG}"
            ;;
        h)
            help
            exit 0
            ;;
        v) 
            echo "v1.0.0"
            exit 0
            ;;
    esac
done

function gradle_init(){


  [[  -z $class_name ]] && printf "Enter class Name : " && read class_name

  mkdir -p $project_name || exit
  mkdir -p $project_name/src/main/java
  mkdir -p $project_name/src/main/resources

  (
    echo "bin/*"
    echo ".project"
    echo ".gradle/*"
    echo ".settings/*"
    echo ".classpath"
    echo "build/*"
  ) > $project_name/.gitignore

  (
    echo -e "plugins{"
    echo -e "\tid 'java'"
    echo -e "}"
    echo -e "jar {"
    echo -e "\tmanifest {"
    echo -e "\t\tattributes 'Main-Class': '$class_name'"
    echo -e "\t}\n}\n"
  ) > $project_name/build.gradle

  folder="$(echo $project_name | sed "s/\./\//g" | xargs dirname)"
  class="$(echo $class_name | sed "s/\./\//g" | xargs basename)"
  mkdir -p $project_name/src/main/java/$folder
  touch $project_name/src/main/java/$folder/$class.java
  [ "$git_init" == "true" ] && git init $project_name
}

function cpp_init(){


  [[  -z $exe_name ]] && printf "Enter executable Name : " && read exe_name

  mkdir $project_name || exit

  mkdir $project_name/src
  mkdir $project_name/include
  mkdir $project_name/bin
  mkdir $project_name/debug
  touch $project_name/src/main.cc

  (
    echo "cmake_minimum_required(VERSION 2.8.9)"
    echo "project($project_name)"
    echo "include_directories(include)"
    echo 'file(GLOB_RECURSE SOURCES "src/*".cc)'
    echo "add_executable($exe_name \${SOURCES})"
    echo "install(TARGETS $exe_name DESTINATION /usr/bin)"
  ) > $project_name/CMakeLists.txt

  (
    echo "#!/bin/sh"
    echo 'if [[ -z $1 ]]; then'
    echo 'mkdir -p bin'
    echo 'cd bin'
    echo 'cmake ..'
    echo 'make'
    echo 'elif [[ "$1" == "install" ]]; then'
    echo 'mkdir -p bin'
    echo 'cd bin'
    echo 'cmake ..'
    echo 'sudo make install'
    echo 'elif [[ "$1" == "debug" ]]; then'
    echo 'mkdir -p debug'
    echo 'cd debug'
    echo 'cmake -DCMAKE_BUILD_TYPE=Debug ..'
    echo 'make'
    echo 'elif [[ "$1" == "project" ]]; then'
    echo 'mkdir -p bin'
    echo 'cd bin'
    echo 'cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..'
    echo 'cp compile_commands.json ..'
    echo 'fi'
    ) > $project_name/build

  chmod u+x $project_name/build

  (
    echo 'bin/*'
    echo 'debug/*'
    echo 'compile_commands.json'
    echo '.vimspector.json'
    echo '.clangd/*'
  ) > $project_name/.gitignore

  (
    echo '{'
    echo '"configurations": {'
    echo '"Launch": {'
    echo '"adapter": "vscode-cpptools",'
    echo '"configuration": {'
    echo '"request": "launch",'
    echo "\"program\": \"debug/$exe_name\","
    echo "\"cwd\": \"`pwd`\"," >> .vimspector.json
    echo '"externalConsole": true,'
    echo '"MIMode": "gdb"'
    echo '}'
    echo '}'
    echo '}'
    echo '}'
  ) > $project_name/.vimspector.json

  [ "$git_init" == "true" ] && git init $project_name

  cd $project_name && ./build project

}

function py_init(){

  mkdir $project_name || exit
  _project_name=$(echo $project_name | sed -e 's/-/_/g')
  mkdir -p $project_name/docs
  mkdir -p $project_name/$_project_name
  mkdir -p $project_name/tests
  touch $project_name/LICENSE
  touch $project_name/README.md
  touch $project_name/TODO.md
  touch $project_name/setup.py
  touch $project_name/.gitignore
  touch $project_name/install.sh
  touch $project_name/$_project_name/__init__.py
  touch $project_name/$_project_name/utils.py
  touch $project_name/$_project_name/__main__.py
  [ "$git_init" == "true" ] && git init $project_name

}

function c_init(){
  echo "Creating project..."
  mkdir $project_name || exit
  _project_name=$(echo $project_name | sed -e 's/-/_/g')
  echo "Created ${project_name} directory in ${PWD}"
  (
    echo '#include <stdio.h>' 
    echo '#include "main.c"'
  ) > $project_name/code.c
  echo "Created code.c in $PWD/$project_name"
  (
    echo '#include <stdio.h>' 
    echo '#include "header.h"'
    echo '' 
    echo 'int main () {' 
    echo '    ' 
    echo '    return 0;' 
    echo '}'  
  ) > $project_name/main.c
  echo "Created main.c in $PWD/$project_name"
  (
    echo '#ifndef HEADER.H' 
    echo '#define HEADER.H' 
    echo '' 
    echo '#endif //HEADER.H' 
  ) > $project_name/header.h
  echo "Created header.h in $PWD/$project_name"
  [ "$git_init" == "true"  ] && (
    echo $project_name | tr '[:upper:]' '[:lower:]' 
    echo '*.pdf' 
    echo '*.pptx' 
    echo '*.vscode' 
  ) > $project_name/.gitignore
  [ "$git_init" == "true" ] && echo "Created .gitignore at $PWD/$project_name"
  [ "$git_init" == "true" ] && git init $project_name
  echo "Done."
  echo -n "Project created " && echo -n "${green}${underline}${bold}SUCCESSFULLY${normal}" && echo " in $PWD"

}

[[  -z $project_name ]] && printf "Enter project Name : " && read project_name

echo "Please select a language:"
select lang in c cpp java python
do 
    case $lang in
      #react )
      #  react_init 
      #  exit 0
      #  ;;
      #react-native )
      #  react_native_init 
      #  exit 0
      #  ;;
      c )
        c_init 
        exit 0
        ;;
      python )
        py_init 
        exit 0
        ;;
      cpp )
        cpp_init 
        exit 0
        ;;
      java )
        gradle_init 
        exit 0
        ;;
      * )
        echo "${red}${underline}${bold}ERROR:${normal} invalid language name; Please select a number between 1 and 4:"
    esac
done



