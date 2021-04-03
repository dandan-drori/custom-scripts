#!/bin/bash

# store the value of PWD - current working directory,
# after replacing everything in the string till "Ex" including it,
# leaving only the assignment number, inside a variable.
ass_num=`echo $PWD | sed 's/.*Ex//g'`

# execute a zip command, recursively,
# save the files and folders in assN.zip where N is the number of
# the assignment. Include the build.xml file and the src folder -
# containing the *.java files.
mkdir ass${ass_num}
mv src ass${ass_num}
mv build.xml ass${ass_num}
zip -r ass${ass_num}.zip ass${ass_num}
