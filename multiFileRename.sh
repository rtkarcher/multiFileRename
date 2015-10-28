#!/bin/bash
#This script should rename all files in a directory sequentially in a Plex-friendly format.
#Created by Emily Thomas
#27 October 2015
#v1.0.0

a=1

echo "In what directory are these files located?"
        read -r fileDirectory
        echo

echo "What is the name of the series these files belong to?"
        read -e seriesName
        echo

echo "What season are these from?"
        read -e seasonNo
        echo

echo "What filetype are they?"
        read -e format
        echo

for i in $fileDirectory/*; do echo $i;

        #plexFormat $seriesName - $seasonNo - episodeNo
        #Example: Breaking Bad - s01e01
        
        #02 pad to length of 2
        plexFormat=$(printf "$seriesName - s%d$seasonNo""e%d$a.$format")

        #Renames the file:
        mv -- "$i" "$fileDirectory/$plexFormat"

        #Increments the episodes:
        let a=a+1

#commented out - this was here for testing that variables were capturing
#echo "$fileDirectory" "," "$seriesName" "," "$seasonNo"

done
