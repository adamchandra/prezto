#!/bin/zsh  

alias ags="ag -G '\.(java|scala)$'"
alias agsi="ag -G '\.(java|scala)$' -i"

for i (1 2 3 4); do
    alias "tree$i"="tree -L $i"
    alias "treed$i"="tree -d -L $i"
done

ccopy(){ cp $1 /tmp/ccopy.$1; }  
alias cpaste="ls /tmp/ccopy* | sed 's|[^\.]*.\.||' | xargs -I % mv /tmp/ccopy.% ./%"  

# directory tree - http://www.shell-fu.org/lister.php?id=209  
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'    
    
#calendar with today highlighted - http://www.shell-fu.org/lister.php?id=210  
alias tcal='cal | sed "s/^/ /;s/$/ /;s/ $(date +%e) / $(date +%e | sed '\''s/./#/g'\'') /"'  
  
# count files by type - http://www.shell-fu.org/lister.php?id=173  
alias ftype='find ${*-.} -type f | xargs file | awk -F, '\''{print $1}'\'' | awk '\''{$1=NULL;print $0}'\'' | sort | uniq -c | sort -nr'  
  
# convert permissions to octal - http://www.shell-fu.org/lister.php?id=205  
alias lo='ls -l | sed -e 's/--x/1/g' -e 's/-w-/2/g' -e 's/-wx/3/g' -e 's/r--/4/g' -e 's/r-x/5/g' -e 's/rw-/6/g' -e 's/rwx/7/g' -e 's/---/0/g''  
  
# get an ordered list of subdirectory sizes - http://www.shell-fu.org/lister.php?id=275  
alias dux='du -sk ./* | sort -n | awk '\''BEGIN{ pref[1]="K"; pref[2]="M"; pref[3]="G";} { total = total + $1; x = $1; y = 1; while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf("%g%s\t%s\n",int(x*10)/10,pref[y],$2); } END { y = 1; while( total > 1024 ) { total = (total + 1023)/1024; y++; } printf("Total: %g%s\n",int(total*10)/10,pref[y]); }'\'''  
  
# share current tree over the web - http://www.shell-fu.org/lister.php?id=54  
alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'  
alias emacs='emacsclient -c -n'
alias visit='emacsclient -n'

alias ssh-or="ssh openreview@vinci8"

alias man="man -M /usr/share/man"
alias psc="ps -e f --format comm"
alias create-iso="mkisofs -J -r -v -V vol -o"
alias burn-iso="cdrecord -v -eject speed=24 dev=0,0,0"
alias mount-iso="mount -t iso9660 -o ro,loop=/dev/loop0"
alias perl-install="perl -MCPAN -e shell"
alias less='less -RSimw~ -x2 --shift=4'
export PAGER='less -RSimw~ -x2 --shift=4'

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
