#!/usr/bin/env bash

set -eu

# First we append the saved layout of worspace N to workspace M
i3-msg "workspace --no-auto-back-and-forth 3; append_layout ${XDG_CONFIG_HOME}/i3/workspace_3.json"

# And finally we fill the containers with the programs they had
(discord &)
(slack &)
(kitty --single-instance htop &)
(kitty --single-instance nvtop &)
# (wezterm start htop &)
# (wezterm start nvtop &)
