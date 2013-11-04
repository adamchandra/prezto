#!/bin/zsh

alias ssh-or="ssh openreview@vinci8"

alias man="man -M /usr/share/man"
alias psc="ps -e f --format comm"
alias create-iso="mkisofs -J -r -v -V vol -o"
alias burn-iso="cdrecord -v -eject speed=24 dev=0,0,0"
alias mount-iso="mount -t iso9660 -o ro,loop=/dev/loop0"
alias perl-install="perl -MCPAN -e shell"
alias less='less -RSimw~ -x2 --shift=4'
export PAGER='less -RSimw~ -x2 -shift=4'

alias tree="tree -Ca -I 'target|.git|.hg|.svn'"

alias psme='ps fUsaunders'
alias kmap="xmodmap ~/.xmodmap"
alias kunmap="xmodmap ~/xmodmap-unswapped"
alias difflr="diff -B --expand-tabs --side-by-side"
alias difflrc="diff -B --suppress-common-lines --expand-tabs --side-by-side"

# alias ssh="export DISPLAY=`uname -n`:0.0; ssh"
# alias ssh="export DISPLAY=`uname -n`:0.0; ssh -Y"
alias ssh="ssh -Y"
alias jetty-reload='touch src/config/jetty/contexts/rexa-context-dev.xml'
alias debug='ant -Ddebug=true -Dsuspend=y'
alias run='ant -Ddebug=true -Dsuspend=n'
alias xi="xargs -i"
alias svn-ignore="svn propedit svn:ignore . --editor-cmd 'emacs -nw --quick'"
alias svnst="svn -q --ignore-externals st"
alias du='du -hs'
alias ack=~/bin/ack
alias ack-scala='~/bin/ack --type=scala'

alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'

alias gittree='git log --graph --full-history --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20 %s %cr"'
alias gittree-who='git log --graph --full-history --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20 %cn %s %cr"'
alias gittree-when='git log --graph --full-history --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20 %cn %s %ci"'
alias git-ci="git commit -a"
alias git-cim="git commit -a -m '.'"


# alias hgs="sudo -u sandy hg"
# alias hg-checkpoint="sudo -u sandy hg ci -m 'checkpoint'"
alias hgtree="hg log --template '{node|short} {author|email}: {desc} ({date|age})\n'"
alias hgchanged='hg extdiff -pkdiff3'
# alias hgsan="sudo chown -R sandy .hg; sudo chgrp -R sandy .hg"
# alias hgsau="sudo chown -R saunders .hg; sudo chgrp -R saunders .hg;"

## Maintain a set of directories which can be cycled through:
##   cd[pn]: cd previous/next directory
##   cds: store directory on stack
##   cdx: pop top dir
##alias cdp='pushd -0 2>&1 > /dev/null; dirs -p'
##alias cdn='pushd +1 2>&1 > /dev/null; dirs -p'
##alias cds='pushd . 2>&1 > /dev/null; dirs -p'
##alias cdx='popd 2>&1 > /dev/null; dirs -p'
##alias dirs='dirs -p'

alias ls="ls -hpx --color=always"
alias l.="ls -a --color=always"
alias ll='ls -alF --color=always'
alias la='ls -Fa --color=always'
alias ld='ls -al -d * | egrep "^d"' # only subdirectories
alias lt='ls -alt | head -20' # recently changed files

alias md='mkdir -p'
alias rd=rmdir
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias cdreal='cd $(pwd -P)'
alias mx='tmuxifier'

alias find-baks='find . -type f -name "*.bak~"'
alias find-baks-rm='find . -type f -name "*.bak~" -ok rm {} ";"'


# setopt appendhistory autocd extendedglob nomatch
unsetopt correctall


# Reference:  http://zsh.sourceforge.net/Guide/zshguide02.html#l16
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh-history

APPEND_HISTORY="true"
# INC_APPEND_HISTORY=0
# SHARE_HISTORY=0
EXTENDED_HISTORY=1
HIST_IGNORE_DUPS=1 
HIST_IGNORE_ALL_DUPS=1 
# HIST_EXPIRE_DUPS_FIRST=0
# HIST_SAVE_NO_DUPS=1 
# HIST_FIND_NO_DUPS=1
# HIST_ALLOW_CLOBBER=1 
HIST_REDUCE_BLANKS=1
HIST_IGNORE_SPACE=1 
HIST_NO_STORE=1
HIST_NO_FUNCTIONS=1
NO_HIST_BEEP=1

export EDITOR='emacsclient-24.2 -n'
export ALTERNATE_EDITOR=""

# alias last and save
# use `als c NAME` to chop off the last argument (for filenames/patterns)
als() {
	local aliasfile chop x
	[[ $# == 0 ]] && echo "Name your alias" && return
	if [[ $1 == "c" ]]; then
		chop=true
		shift
	fi
	aliasfile=~/.dyna-aliases
	touch $aliasfile
	if [[ `cat "$aliasfile" |grep "alias ${1// /}="` != "" ]]; then
		echo "Alias ${1// /} already exists"
	else
		x=`fc -l -2 | sed -e '$!{h;d;}' | sed -e 's/.\{7\}//'`
		if [[ $chop == true ]]; then
			echo "Chopping..."
			x=$(echo $x | rev | cut -d " " -f2- | rev)
		fi
		echo -e "\nalias ${1// /}=\"`echo $x|sed -e 's/ *$//'|sed -e 's/\"/\\\\"/g'`\"" >> $aliasfile && source $aliasfile
		alias $1
	fi
}
