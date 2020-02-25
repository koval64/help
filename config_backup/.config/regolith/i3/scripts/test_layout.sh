#!/bin/bash

WORKSPACE4="4: discord"

# First we append the saved layout of worspace N to workspace M
i3-msg "workspace $WORKSPACE4; append_layout ~/.config/i3/layouts/04.json"

# And finally we fill the containers with the programs they had
(discord &)
