#!/usr/bin/env bash

set -eu

# First we append the saved layout of worspace N to workspace M
for num in 3 1; do i3-msg "workspace ${num}; append_layout ${HOME}/.config/i3/workspace_${num}.json"; done

# And finally we fill the containers with the programs they had
(discord &)
(slack &)
(vivaldi-stable &)
(kitty --single-instance htop &)
(kitty --single-instance nvtop &)
