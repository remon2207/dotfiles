#!/usr/bin/env bash

set -eu

# First we append the saved layout of worspace N to workspace M
i3-msg "workspace 3; append_layout ${HOME}/.config/i3/workspace_3.json"
i3-msg "workspace 1; append_layout ${HOME}/.config/i3/workspace_1.json"

# And finally we fill the containers with the programs they had
(discord &)
(slack &)
(kitty -1 htop &)
(vivaldi-stable &)
