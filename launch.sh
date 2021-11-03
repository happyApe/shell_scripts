#! /usr/bin/env bash
# requires wmctrl package, for fedora/ubuntu-based : sudo dnf/apt install wmctrl

# It is just a simple startup script which checks for network connectivity and if online,
# then it opens up my daily-use apps/programs on different workspaces just the way I like it ;)

while :; do
    wget -q --tries=10 --timeout=20 --spider http://google.com
    if [[ $? -eq 0 ]]; then
            echo "Status : Online"
            break
    else
            notify-send -i error "Not Connected to Wi-Fi Network"
            echo "Status : Offline"
            sleep 10
    fi
done

sleep 3

wmctrl -s 0 # Switches to workspace 0 
nohup vivaldi-stable & disown
sleep 3
wmctrl -s 1 # Switches to workspace 1 
nohup slack & disown
sleep 2
wmctrl -s 2 # Switches to workspace 2
nohup firefox &>/dev/null & disown
sleep 4
wmctrl -s 3 # Switches to workspace 3
# nohup flatpak run com.github.alainm23.planner & disown
nohup google-chrome-stable &>/dev/null & disown
sleep 2
# Moves google chrome window to workspace 3 
# fetches window id of chrome 
sleep 2
window_id=$(wmctrl -l | tail -1 | cut -f1 -d" ")
# transfers the chrome (from fetched window id) to workspace 3
wmctrl -i -r "$window_id" -t 2
sleep 2
wmctrl -s 0 # Will go to workspace 0 after script is done executing
exit


