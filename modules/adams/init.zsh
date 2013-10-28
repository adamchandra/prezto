#!/bin/zsh
#
# Adam's own pile 'o customizations
#
# Authors:
#   Adam Saunders
#

source "${0:h}/zsh-common-init.zsh" || return 1

MACHINE_NAME=`uname -n`

LOCAL_ZSHRC=${0:h}/zshrc-$MACHINE_NAME
# load machine-specific settings
[[ -f "$LOCAL_ZSHRC" ]] && source "$LOCAL_ZSHRC"

MISC_FUNCTIONS=${0:h}/misc-functions
[[ -f "$MISC_FUNCTIONS" ]] && source "$MISC_FUNCTIONS"

