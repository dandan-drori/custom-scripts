#!/bin/bash

# currently supported file types:
# directories - -d
# images - jpg, png, jpeg
# documents - txt, md
# scripts - sh, py

# path to downloads
path="/home/dandan/Downloads"
# path to move images to
pictures_path="/home/dandan/Pictures"
# path to move documents to
documents_path="/home/dandan/Documents"
# path to move directories to
installed_programs_path='/home/dandan/Installed*Programs'

files=$(ls $path)

for file in $files; do
  if [ -d ${path}/$file ]; then
    mv ${path}/$file $installed_programs_path
  else
    png=$(echo $file | grep 'png')
    [[ $png != "" ]] && mv ${path}/$png $pictures_path

    jpg=$(echo $file | grep 'jpg')
    [[ $jpg != "" ]] && mv ${path}/$jpg $pictures_path

    jpeg=$(echo $file | grep 'jpeg')
    [[ $jpeg != "" ]] && mv ${path}/$jpeg $pictures_path

    txt=$(echo $file | grep 'txt')
    [[ $txt != "" ]] && mv ${path}/$txt $documents_path

    md=$(echo $file | grep 'md')
    [[ $md != "" ]] && mv ${path}/$md $documents_path

    sh=$(echo $file | grep 'sh')
    [[ $sh != "" ]] && mv ${path}/$sh $documents_path

    py=$(echo $file | grep 'py')
    [[ $py != "" ]] && mv ${path}/$py $documents_path
  fi
done
