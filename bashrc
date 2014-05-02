#[ ~/.bashrc - edited 20140310 ]# 

###|colors|###
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

###|prompt|###
if [ -n "$SSH_CLIENT" ]; then
    PS1="\[$bldred\]ssh\[$bldblu\] \w \[$bldgrn\]>\[$txtrst\] "
else
    PS1="\[$bldblu\] \w \[$bldgrn\]>\[$txtrst\] "
fi

###|export|###
export LS_OPTIONS='--color=auto'
export HISTSIZE=9999
export CCACHE_DIR="/home/storge/.ccache"
export CC="ccache gcc"
export CXX="ccache g++"
export PATH="/usr/lib/ccache:$PATH"
export CONCURRENCY_LEVEL=3

###|alias|###
alias cake="echo 'you can have me and eat me too'"
alias scrn0="scrot ~/img/scrn/scrot-%Y%m%d-%H%M%S.png -e 'viewnior $f'"
alias scrn3="scrot -d 3 ~/img/scrn/scrot-%Y%m%d-%H%M%S.png -e 'viewnior $f'"
alias scrn5="scrot -d 5 ~/img/scrn/scrot-%Y%m%d-%H%M%S.png -e 'viewnior $f'"
alias newsbeuter.storge="newsbeuter -C ~/.newsbeuter/newsbeuter.storge"
alias apt-get="sudo apt-get"
alias uzbl='uzbl-tabbed'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10' 
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cls='clear && ls -hal'
alias peek='cd $1 && clear && ls -hal'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias mkdir='mkdir -pv'
alias mount='mount |column -t'
alias bc='bc -l'
alias diff='colordiff'
alias ports='netstat -penult'
alias wget='wget -c'
alias chmod='chmod --preserve-root'
alias flupdate='sudo update-flashplugin-nonfree --install'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias hotproc="echo 'cpu temp is: $(sensors -u | grep -i temp1_input | cut -d : -f 2)°C'"
alias terminator-desktop="terminator --profile Desktop --geometry 800x642+168+71"
alias tmux="tmux -2"
alias xkbfu="conky -q -c /home/storge/.conk/cb5010-xkbfoo"
alias ohai='dd if=/dev/urandom of=~/ohai.nsa bs=1048576 count=5'
alias webcam="vlc v4l2:///dev/video0"

###|browser|###
function go () 
{
    	xdg-open http://$1 &
}

###|twitter-lookup|###
function lookup ()
{
        xdg-open http://twitter.com/$1
}

###|uncompress|###
extract() 
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.xz)    tar xvJf $1   ;;
      *.tar.bz2)   tar xvjf $1   ;;
      *.tar.gz)    tar xvzf $1   ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xvf $1    ;;
      *.tbz2)      tar xvjf $1   ;;
      *.tgz)       tar xvzf $1   ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo " '$1' cannot be extracted via extract" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

###|SETTING TERM|###
case "$TERM" in
*-256color)
    alias ssh='TERM=${TERM%-256color} ssh'
    ;;
*)
    POTENTIAL_TERM=${TERM}-256color
    POTENTIAL_TERMINFO=${TERM:0:1}/$POTENTIAL_TERM

    # better to check $(toe -a | awk '{print $1}') maybe?
    BOX_TERMINFO_DIR=/usr/share/terminfo
    [[ -f $BOX_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
        export TERM=$POTENTIAL_TERM

    HOME_TERMINFO_DIR=$HOME/.terminfo
    [[ -f $HOME_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
        export TERM=$POTENTIAL_TERM
    ;;
esac
# notes on setting TERM:
# Setting TERM to xterm-256color in your .bashrc can be presumptuous
# especially if you use the same .bashrc on multiple machines.
# The alias of ssh is a defensive measure to prevent us from trying 
# to open a 256-color terminal on a remote machine that doesn't 
# necessarily support it. The main block is the other half of the 
# equation; it checks to see if the corresponding terminfo entry 
# exists, and sets it if it does. --Max Cantor




