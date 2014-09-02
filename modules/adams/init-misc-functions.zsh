#!/bin/bash

#compare files using comm (requires perl) - http://www.shell-fu.org/lister.php?id=186  
compare(){  
  comm $1 $2 | perl -pe 's/^/1: /g;s/1: \t/2: /g;s/2: \t/A: /g;' | sort  
}  
    
# portscan in one line - http://www.shell-fu.org/lister.php?id=295  
# portscan(){  
#   HOST="$1";for((port=1;port<=65535;++port));do echo -en "$port ";if echo -en "open $HOST $port\nlogout\quit" | telnet 2>/dev/null | grep 'Connected to' > /dev/null;then echo -en "\n\nport $port/tcp is open\n\n";fi;done  
# }  
  
# keep your home directory organised - http://www.shell-fu.org/lister.php?id=310  
export TD="$HOME/temp/`date +'%Y-%m-%d'`"  
td(){  
    td=$TD  
    if [ ! -z "$1" ]; then  
        td="$HOME/temp/`date -d "$1 days" +'%Y-%m-%d'`";  
    fi  
    mkdir -p $td; cd $td  
    unset td  
}  
  
calc(){ echo "${1}"|bc -l; }  

wm-info() { while ( true ); do xprop | egrep "(^WM_(CLASS|NAME))|WM_PID"; echo; done; }
  
extract () { 
    mkdir "$1.d"
    cd "$1.d"
    fn="../$1"
    if [ -f $fn ] ; then  
        case $1 in  
            *.tar.bz2)   tar xvjf $fn   ;;  
            *.tar.gz)    tar xvzf $fn   ;;  
            *.bz2)       bunzip2 $fn    ;;  
            *.rar)       unrar x $fn    ;;  
            *.gz)        gunzip $fn     ;;  
            *.tar)       tar xvf $fn    ;;  
            *.jar)       jar xvf $fn    ;;  
            *.war)       jar xvf $fn    ;;  
            *.tbz2)      tar xvjf $fn   ;;  
            *.tgz)       tar xvzf $fn   ;;  
            *.zip)       unzip $fn      ;;  
            *.Z)         uncompress $fn ;;  
            *.7z)        7z x $fn       ;;  
            *)           echo "'$!' cannot be extracted via >extract<" ;;  
        esac  
    else  
        echo "'$1' is not a valid file"  
    fi  
    cd ..
}  

#  alias connectioncount=netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print ""}'
connections() {
    netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq | xargs -i host {} | awk '{print $5}'
}

NOTESDIR=~/projects/the-library/project-planning/shell-notes

note() {
    declare notefile="$NOTESDIR/notes_$1.txt"
    echo "$notefile"
    touch "$notefile"
    cat <<EOF >> "$notefile"

[note ^^^^^^^^^^^^^^^^^^^^]
tags=$*
[history]
EOF

    history | tail -n 15 >> "$notefile"

    cat <<EOF >> "$notefile"
[/history]
[/note ____________________]


EOF

    emacsclient -n -nw "$notefile"
}  

nls() { 	
    ls -c "$NOTESDIR" | grep "$*" 
}


killsbt() {
    PROCESS=`ps fUsaunders | grep java | grep sbt-launch`
    echo "killing process $PROCESS"
    echo $PROCESS | cut -b 1-8 | perl -pne 's/[^0123456789]//g' | xargs -i kill {}
}


