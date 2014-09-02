#!/bin/zsh
#
# Adam's own pile 'o customizations
#
# Authors:
#   Adam Saunders
#

setxkbmap -option ctrl:swapcaps
xinput set-prop 10 "Device Enabled" 0

MACHINE_NAME=`uname -n`

LOCAL_ZSHRC=${0:h}/init-$MACHINE_NAME

# load machine-specific settings
[[ -f "$LOCAL_ZSHRC" ]] && source "$LOCAL_ZSHRC"

source ${0:h}/init-history-settings.zsh
source ${0:h}/init-misc-functions.zsh
source ${0:h}/init-aliases.zsh

