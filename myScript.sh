#!/usr/bin/env bash

cd $1 #now in the file containing all zipped HWs

for file in `dir -d *` ; do  #JUST DISPLAYS all files that are .tar, .gz and .bz2
    if [ ${file##*.} = tar ]
    then
        echo "(uncompressed tar)"
        tar xvf $file
    elif [ ${file##*.} = gz ]
    then
        echo "(gzip-compressed tar)"
        tar xzvf $file      
    elif [ ${file##*.} = zip ]
    then
        echo "(zipped file)"
        unzip $file 
    fi
done


for file in `dir -d *` ; do  #delete all compressed files now that we have the uncompressed versions
    if [ ${file##*.} = tar ]
    then
        rm $file
    elif [ ${file##*.} = gz ]
    then
        rm $file
    elif [ ${file##*.} = zip ]
    then
        rm $file 
    fi
done

for dir in `dir -d *` ; do  #loop through all my new directories
    if [ -d "$dir" ]  #if it's a directory
    then 
        cd $dir      #change to it
        for file in `dir -d *` ; do  #loop through all the files in the sub directory
            if [[ ${file##*.} == "c" ]] #if it's a c file (all we care about)
            then 
                foo=${file%%.*}  #store filename as foo, minus the ".c"
                gcc -o $foo $file  #compile & Bob's your uncle
            fi
        done
        cd ..  #jump back up to previous dir
    fi
done
            
            
            
            
