#! /bin/bash

# A shell script to assist my dicitonary.py script

# What it does ? -> 
#   Whenever I will press shortcut key <ctrl> + ` (Set this in keyboard shortcuts in gnome settings), on a highlighted 
#   word it will use xclip to get that word and then it will run Konsole (terminal) with the dictionary command and the
#   highlighted word, you need to close the Konsole window manually ( will maybe work on this later to press enter and 
#   window closes )

# Things to set up -> 

#   Create the custom keyboard shortcut with shortcut key <ctrl> + `
#   and command as : /bin/bash /home/<user_name>/Playground/shell_scripts/dictionary_xclip.sh
#   You need the dictionary.py file in the specified location as in the script (my webscraping folder for now)
#   You need the konsole terminal application also
#   I used konsole instead of the gnome-terminal as gnome-terminal command (uncomment that to see), it gives a 
#   small banner warning uptop "child process finished with exit code : 0", It bothers me a bit and konsole terminal
#   doesn't show this, so using console


# Get the currently selected text using xlcip -o
text=$(xclip -o)

# Print the selection 
echo $text
set -- $text
echo $1

# for eval 
# dictionary="/home/voila/Playground/Automate\ Boring\ Stuff/WebScraping/dictionary.py"
# eval "$dictionary" -w $1

dictionary="/home/skipper/Playground/Automate Boring Stuff/WebScraping/dictionary.py"
# Send a notification to inform script is running
notify-send "Running dictionary" "Searching for word $1"
# gnome-terminal --window-with-profile=vocab --  "$dictionary" -w "$1" & disown
konsole --hold -e "$dictionary" -w "$1"
# Play bell sound when script is done running
echo -e "\a"

