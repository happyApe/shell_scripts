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
    # tmux send-keys -t 'vim' "cd ~/ScaleTorch/cli/scaletorch_cli" C-m 'clear' C-m
    tmux send-keys -t 'vim' "cd ~/ScaleTorch/jobController/src/" C-m 'clear' C-m

    # Create cli window
    tmux new-window -t $SESSION:2 -n 'cli'
    tmux send-keys -t 'cli' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'cli' "cd ~/ScaleTorch/cli" C-m 'clear' C-m

    # Create a authenticator window
    tmux new-window -t $SESSION:3 -n 'authenticator'
    tmux send-keys -t 'authenticator' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'authenticator' "cd ~/ScaleTorch/authenticator" C-m 'clear' C-m

    # Create a ScaleTorch window
    tmux new-window -t $SESSION:4 -n 'ScaleTorch'
    tmux send-keys -t 'ScaleTorch' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'ScaleTorch' "cd ~/ScaleTorch/" C-m 'clear' C-m

fi
# Attach session on the first window
tmux attach-session -t $SESSION:1

