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
    tmux send-keys -t 'vim' "cd ~/ScaleTorch/jobController/" C-m 'clear' C-m

    # Splitting the first window into two panes
    # Select Pane 1
    tmux selectp -t 1
    # Splitting Pane 1 by 25 %
    tmux splitw -v -p 25
    tmux send-keys -t 'vim' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'vim' "cd ~/ScaleTorch/jobController" C-m 'clear' C-m
    tmux selectp -t 1

    # Create another window same as first window
    tmux new-window -t $SESSION:2 -n 'JC'
    tmux send-keys -t 'JC' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'JC' "cd ~/ScaleTorch/jobController" C-m 'clear' C-m

    # Create cli window
    tmux new-window -t $SESSION:3 -n 'cli'
    tmux send-keys -t 'cli' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'cli' "cd ~/ScaleTorch/cli" C-m 'clear' C-m

    # Create a scaletorch window
    tmux new-window -t $SESSION:4 -n 'scaletorch'
    tmux send-keys -t 'scaletorch' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'scaletorch' "cd ~/ScaleTorch/scaletorch" C-m 'clear' C-m

    # Create a ScaleTorch window
    tmux new-window -t $SESSION:5 -n 'ScaleTorch'
    tmux send-keys -t 'ScaleTorch' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'ScaleTorch' "cd ~/ScaleTorch/" C-m 'clear' C-m


    # Splitting the last window into two panes
    # Select Pane 1
    tmux selectp -t 0
    # Splitting Pane 1 by 10%
    tmux splitw -v -p 10
    tmux send-keys -t 'ScaleTorch' "conda activate scaletorch" C-m 'clear' C-m
    tmux send-keys -t 'ScaleTorch' "cd ~/ScaleTorch/" C-m 'clear' C-m

    # Switch to top-pane of the last window
    tmux selectp -t 1
fi
# Attach session on the first window
tmux attach-session -t $SESSION:1

