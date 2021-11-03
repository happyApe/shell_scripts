#! /bin/bash

# Setup workspace called work with two 3 windows
# tmux configuration for the eeg_pipeline repo work

SESSION="scaletorch"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "$SESSIONEXISTS" = "" ]
then
    # create a new tmux session
    tmux new-session -d -s $SESSION

    # Name first window
    tmux rename-window -t 1 'vim'
    # tmux send-keys -t 'vim' "source ~/py3.6/bin/activate" C-m 'clear' C-m
    tmux send-keys -t 'vim' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'vim' "cd ~/ScaleTorch/" C-m 'clear' C-m

    # Create another window
    tmux new-window -t $SESSION:2 -n 'zsh'
    # tmux send-keys -t 'zsh' "source ~/py3.6/bin/activate" C-m 'clear' C-m
    tmux send-keys -t 'zsh' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'zsh' "cd ~/ScaleTorch/" C-m 'clear' C-m

    # Create a general window
    tmux new-window -t $SESSION:3 -n 'shell'
    tmux send-keys -t 'shell' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'shell' "cd ~/ScaleTorch/" C-m 'clear' C-m
    # tmux send-keys -t 'zsh' "zsh" C-m 'clear' C-m
fi
# Attach session on the first window
tmux attach-session -t $SESSION:1

