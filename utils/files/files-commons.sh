#!/bin/bash

echo list all the files in the path $1 passed as parameter 
for dir in $1*/ 
do 
	echo $dir 
done

exit
