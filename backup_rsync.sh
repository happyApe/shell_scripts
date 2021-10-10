#!/bin/bash

if $(zenity --question --text="Dry run?"); then
    DRY_RUN="--dry-run"
else
    DRY_RUN=""
fi

echo "Are you using Elements Hard-drive and Is is Connected?" 
$ans
select yn in "Yes" "No"; do
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Aborting.."; exit;;
    esac
done

TARGET="/run/media/$USER/Elements/Manjaro\ 2021"
echo "Using ${TARGET}"

if $(zenity --question --text="Should files deleted from home directory be deleted from hard drive too?"); then
    DELETE="--delete"
else
    DELETE=""
fi

OPTIONS="$DRY_RUN -arvhPW --no-compress --info=progress2 $DELETE"

DIR1="Coding\ Blocks"
DIR2="Deep\ learning\ stuff"
DIR3="Coursera\ Courses"
DIR4="Desktop"
DIR5="Documents"
DIR6="Downloads"
DIR7="dotfiles"
DIR8="LeetCode"
DIR9="Notes\ and\ Stuff"
DIR10="Pictures"
DIR11="Playground"
DIR12="Research\ Work"
DIR13="Side\ Stuff"
DIR14="Udemy\ Courses"
declare -a FOLDERS=("$DIR1" 
                "$DIR2"
                "$DIR3"
                "$DIR4"
                "$DIR5"
                "$DIR6"
                "$DIR7"
                "$DIR8"
                "$DIR9"
                "$DIR10"
                "$DIR11"
                "$DIR12"
                "$DIR13"
                # "$DIR14"
                )

printf "\n##### Syncing Folders #####\n\n"

for folder in "${FOLDERS[@]}";do

    printf "\n**** Syncing $folder ****\n"
    eval rsync "$OPTIONS" $HOME/$folder/ ${TARGET}/$folder
    printf "\n**** Sync done ****\n"

done

FILE1="mitacs_tips.txt"
FILE2="packages_list.txt"
FILE3="vocab.csv"
FILE4=".my-credentials"

declare -a FILES=("$FILE1"
                "$FILE2"
                "$FILE3"
                "$FILE4"
            )


printf "\n##### Syncing Files #####\n\n"

for file in "${FILES[@]}";do

    printf "\n**** Syncing $file ****\n"
    eval rsync "$OPTIONS" $HOME/$file ${TARGET}/$file
    printf "\n**** Sync done ****\n"

done

printf "\n##### Done #####\n"


