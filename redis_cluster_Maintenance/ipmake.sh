#!/bin/sh
cat $1 | while read line
do
	for ((i=9001;i<=9016;i++))
	do
	  echo -ne "\"tcp://$line:$i\"",
	done
done
echo ""
