#!/bin/bash

path="/home/dandan/Pictures"
backups_path="${path}/backups"
pictures=$(ls $path | grep 'png')
num_of_pictures=$(ls $path | wc -l)

for picture in $pictures; do
  echo "${path}/$picture"
  [[ $num_of_pictures>30 ]] && mv ${path}/$picture $backups_path 
  [[ $num_of_pictures>30 ]] && (( $num_of_pictures -= 1 ))
  echo "$num_of_pictures"
done
