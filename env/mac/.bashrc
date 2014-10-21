PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH
PATH=/Applications/MATLAB_R2013a.app/bin:$PATH
# PATH=/usr/local/Cellar/android-ndk/r9c:$PATH
# PATH=/usr/local/Cellar/android-sdk/22.3:$PATH
# PATH=/usr/local/Cellar/android-sdk/22.3/tools:$PATH
# PATH=/usr/local/Cellar/android-sdk/22.3/platform-tools:$PATH
# PATH=/usr/local/share/python:$PATH


set -o vi

if [ -f ~/.git-completion.bash ]
then
	source ~/.git-completion.bash
fi


# linux
#name=`hostname -s`
# osx
name=`networksetup -getcomputername`

# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# Mac
export PS1='\u@$name \[\033[1;33m\]\w\[\033[0m\] $(parse_git_branch)$ '

# linux
#export PS1='\u@\h \[\034[1;33m\]\w\[\033[0m\] $(parse_git_branch)$ '
#export PS2="[\t] [\u@\h \w]$ "

export TERM="xterm-256color"
export LSCOLORS="fxexcxdxbxegedabagacad"

export EDITOR="vim"
export ELAB="jin81@elab.ecn.purdue.edu"
# export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export OPENCVLIB="-I/usr/local/include/opencv -L/usr/local/lib -lm -lopencv_core -lopencv_highgui -lopencv_imgproc"

# android SDK & NDK
export ANDROIDSDK="/usr/local/Cellar/android-sdk/22.3"
export ANDROIDNDK="/usr/local/Cellar/android-ndk/r9c"
export ANDROIDNDKVER=r9c
export ANDROIDAPI=19

export CC="/usr/local/bin/gcc-5"
export CXX="/usr/local/bin/g++-5"
export CPP="/usr/local/bin/cpp"
export LD="/usr/local/bin/gcc"
alias g++="/usr/local/bin/g++-5"
alias gcc="/usr/local/bin/gcc-5"
alias cpp="/usr/local/bin/cpp"
alias ld="/usr/local/bin/gcc-5"
alias cc="/usr/local/bin/gcc-5"

alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"
alias ls="ls -G -F"
alias ll="ls -l"
alias sc="screen -RR -d"
alias eject='hdiutil eject'
alias cpwd='pwd|xargs echo -n|pbcopy'
alias cdpwd='cd $(pwd -P)'
alias server="ssh jin81@elab.ecn.purdue.edu"
alias serverx="ssh -X jin81@elab.ecn.purdue.edu"
alias serverw="ssh jin81@weldon.ecn.purdue.edu"
alias servern="ssh -X jin81@ecegrid.ecn.purdue.edu"
alias servert="ssh jhjin@mystory.teradeep.com"
alias serverg0="ssh jhjin@elab-gpu0.ecn.purdue.edu"
alias serverg1="ssh jhjin@elab-gpu1.ecn.purdue.edu"
alias serverg2="ssh jhjin@elab-gpu2.ecn.purdue.edu"
alias serverg3="ssh jhjin@elab-gpu3.ecn.purdue.edu"
alias serverg4="ssh jhjin@elab-gpu4.ecn.purdue.edu"
alias serverg5="ssh jhjin@elab-gpu5.ecn.purdue.edu"
alias serverg6="ssh jhjin@elab-gpu6.ecn.purdue.edu"
alias serverg7="ssh jhjin@elab-gpu7.ecn.purdue.edu"
alias serverg8="ssh jhjin@elab-gpu8.ecn.purdue.edu"
alias serverg0x="ssh -X jhjin@elab-gpu0.ecn.purdue.edu"
alias serverg1x="ssh -X jhjin@elab-gpu1.ecn.purdue.edu"
alias serverg2x="ssh -X jhjin@elab-gpu2.ecn.purdue.edu"
alias serverg3x="ssh -X jhjin@elab-gpu3.ecn.purdue.edu"
alias serverg4x="ssh -X jhjin@elab-gpu4.ecn.purdue.edu"
alias serverg5x="ssh -X jhjin@elab-gpu5.ecn.purdue.edu"
alias serverg6x="ssh -X jhjin@elab-gpu6.ecn.purdue.edu"
alias serverg7x="ssh -X jhjin@elab-gpu7.ecn.purdue.edu"
alias serverg8x="ssh -X jhjin@elab-gpu8.ecn.purdue.edu"
alias grep="grep --colour=auto"
alias matlab="matlab -nodesktop -nosplash"
alias nmap="/usr/local/Cellar/nmap/6.47/bin/nmap -sn 128.46.90.201-255"

# open terminal with full screen by default
function open_terminal_with_full_screen {
	if ! /usr/bin/pgrep -q bash ; then
		osascript -e 'tell app "System Events" to keystroke "f" using {control down, command down}'
	fi
}
open_terminal_with_full_screen

function fifi() { find . -name "*$@*" -print ;}

function sw() {
    echo "${@}" | aspell pipe
}

function www() {
	open "http://$1"
}

function ggl() {
    python -c "import sys, webbrowser, urllib;   webbrowser.open('http://www.google.com/search?' + urllib.urlencode({'q': ' '.join(sys.argv[1:]) }))" $@
}

function zc706() {
        ZQIP_PATH="${HOME}/.ip_addr/ip-addr-zc706-team"
	scp -q jin81@elab.ecn.purdue.edu:/export/home/a/neuflow/zynq-system/ip_addr/ip-addr-zc706-team $ZQIP_PATH
        while [ 1 ]
        do
                case "$1" in
                        p) cat $ZQIP_PATH | tr -d ' '; break;;
                        b) ssh -o ConnectTimeout=1 linaro@$(cat $ZQIP_PATH | tr -d ' '); break;;
                        *) ssh -X -t -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=1 linaro@$(cat $ZQIP_PATH | tr -d ' ') "tmux attach || tmux new"; sleep 3;;
                esac
        done
}

function zed() {
        ZQIP_PATH="${HOME}/.ip_addr/ip-addr-zed-jh"
	scp -q jin81@elab.ecn.purdue.edu:/export/home/a/neuflow/zynq-system/ip_addr/ip-addr-zed-jh $ZQIP_PATH
        while [ 1 ]
        do
                case "$1" in
                        p) cat $ZQIP_PATH | tr -d ' '; break;;
                        b) ssh -o ConnectTimeout=1 linaro@$(cat $ZQIP_PATH | tr -d ' '); break;;
                        *) ssh -X -t -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o ConnectTimeout=1 linaro@$(cat $ZQIP_PATH | tr -d ' ') "tmux attach || tmux new"; sleep 3;;
                esac
        done
}



# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
alias j=jump
alias m=mark
alias um=unmark
alias ms=marks

# Enable extended globbing.
shopt -s extglob

#Extended globbing as described by the bash man page:
#
# ?(pattern-list)   Matches zero or one occurrence of the given patterns
# *(pattern-list)   Matches zero or more occurrences of the given patterns
# +(pattern-list)   Matches one or more occurrences of the given patterns
# @(pattern-list)   Matches one of the given patterns
# !(pattern-list)   Matches anything except one of the given patterns

export LD_LIBRARY_PATH=/opt/X11/include/:/usr/local/lib/:/usr/local/lib64

# Source:DonaldKnuth - http://c2.com/cgi/wiki?PrematureOptimization
echo -e "\x1B[34mPremature optimization is the root of all evil. Don't be evil. \n나는 볼품없는 연구자이지만 삶에는 부족하지 않다.\x1B[39m"
