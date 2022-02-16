#!/bin/bash
BACKUPFILENAME=$(date +%d_%m_%Y_%H%M%S)
echo $BACKUPFILENAME

echo What is path of folder or file what you want backup?
read path
echo $path
if [ -f $path ] || [ -d $path ]
then 
	tar -cvzf /tmp/backup/${BACKUPFILENAME}.tar.gz $path
	echo "Backup finished successfully please find file on location /tmp/backup/${BACKUPFILENAME}.tar.gz"
else
	echo "File or folder does not exist on system......Closing!"
fi
