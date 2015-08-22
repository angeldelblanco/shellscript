#!/bin/bash

# Check if folder exits
#	Exit - delete all its contents
#	Do not exit - create it
	
if [ ! $# -eq 2 ]
  then
    echo "Parameters error: two arguments needed."
    echo "	1.- Path where check folder and destroy it if it exists."
    echo "	2.- The name of the folder to check and destroy."
    exit 1
fi

folder2check=$1/$2

if [ ! -d "$folder2check" ]; then
	echo "The directory $folder2check does not exist, create it."
	mkdir $folder2check
else 
	echo "The directory $folder2check exists"
	if [ "$(ls -A $folder2check)" ]; then
	   echo "$folder2check is not empty, deleting its content."
	   rm $folder2check/*
	else
	   echo "$folder2check is empty, no action performed."
	fi
fi

exit

