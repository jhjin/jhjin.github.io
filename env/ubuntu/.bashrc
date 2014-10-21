[ -z "$PS1" ] && return
PATH=/usr/local/sbin:/usr/local/bin:~/local/bin:$PATH

set -o vi

if [ -f ~/.git-completion.sh ]
then
	source ~/.git-completion.sh
fi



# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
# function parse_git_dirty {"";}   # use this when working in linux kernel repo

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\] $(parse_git_branch)$ '
export LD_LIBRARY_PATH=$HOME/.opencv/lib:$LD_LIBRARY_PATH
export EDITOR="vim"

alias vi="vim"
alias grep="grep --colour=auto"
alias ls="ls --color"
alias ll="ls -l"
alias tmux="tmux attach || tmux new"
alias cdpwd="cd $(pwd -P)"
alias glog='git log --decorate --graph --stat'

function fifi() { find . -name "*$@*" -print ;}

function sw() {
    echo "${@}" | aspell pipe
}

function google() {
    python -c "import sys, webbrowser, urllib;   webbrowser.open('http://www.google.com/search?' + urllib.urlencode({'q': ' '.join(sys.argv[1:]) }))" $@
}



# Enable extended globbing.
shopt -s extglob

#Extended globbing as described by the bash man page:
#
# ?(pattern-list)   Matches zero or one occurrence of the given patterns
# *(pattern-list)   Matches zero or more occurrences of the given patterns
# +(pattern-list)   Matches one or more occurrences of the given patterns
# @(pattern-list)   Matches one of the given patterns
# !(pattern-list)   Matches anything except one of the given patterns

PATH=$PATH:/usr/local/cuda/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
