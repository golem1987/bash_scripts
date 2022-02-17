#!/bin/bash

# simple list of files with permissions from specified folder
echo "Name of directory "
read folder

# taking only files from current directory

if [ -d $folder ]
then
	FILELIST=$(find $folder -maxdepth 1 -type f )
fi

# list file permission from current directory and stdout them to screen

for INDEX in ${FILELIST[@]}; do
 ls -la $INDEX
done
