#!/bin/bash

FILES=`find $1 -depth 1 | sort`

for f in $FILES
do
	plutil -p $f/Contents/Info.plist |
		awk '/CFBundleShortVersionString/ {print substr($3, 2, length($3)-2)}\
			/CFBundleName/ {print substr($3, 2, length($3)-2)}' |
		tr '\n' '\t';
	printf "\n"
done
