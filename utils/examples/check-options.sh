#!/bin/bash

# This script check the options introduced by user. 

# functions definition
usage ()
{
	echo "This is an example about how to check the options in shell script"
	echo "Options: "
	echo "	-t | --test => expects any string, will be shown in first position with \"TEST\" prefix."
	echo "	-o | --test => \"OPTION\" string will be shown in second position"
	echo "The options can be used in any order, but the output will be allways the same."
	echo "EXAMPLES: " 
	echo "		check-options.sh -t test1 -o => TEST test1 OPTION"	
	echo "		check-options.sh -o -t test1 => TEST test1 OPTION"	
	echo "		check-options.sh -t test1 => TEST test1"	
	echo "		check-options.sh -o => OPTION"	
	echo "		check-options.sh => Nothing to say"	

} 


if [ $# -eq 0 ]
  then
	echo "Nothing to say"
	exit
fi


t_option=""
o_option=0
text2echo=""

while [ "$1" != "" ]; do
    case $1 in
        -t | --test )           shift
				if [ -z "$1" ]; then
  					  echo "Error: -t option has to be followed by a string."
					  exit 1
				else
				    t_option=$1
				fi
                                ;;
        -o | --option )    	o_option=1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done



if [ "$t_option" != "" ]; then
	text2echo="TEST $t_option"
fi

if [ $o_option -eq 1 ]; then
	text2echo="$text2echo OPTION"
fi

echo $text2echo
exit


