# cartan needs this for sl6 to work
if [ -r /etc/bashrc ]; then
    . /etc/bashrc
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export HISTCONTROL=nodups
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1="\n\[\e[1;35m\]\d\[\e[m\] \[\e[1;32m\]\A\[\e[m\]\n\[\e[1;34m\]\w\[\e[m\] \h\n\[\e[1;34m\]$\[\e[m\] "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias la='ls -lA'
alias l='ls -CF'

fastq_reads() {
    expr `wc -l < $1` / 4    
}

fastqgz_reads() {
    num_reads=$(expr $(zcat $1 | wc -l) / 4)
    echo "$1: $num_reads"
}
export -f fastqgz_reads

preview() {
    if [ $# = 2 ]; then
        file_name=$2
        num_lines=$1
    else
        file_name=$1
        num_lines=1000
    fi
    head -n $num_lines $file_name | vim - -R
}

preview_sam() {
    if [ $# = 2 ]; then
        file_name=$2
        num_lines=$1
    else
        file_name=$1
        num_lines=1000
    fi
    grep -v '^@' $file_name | head -n $num_lines | column -t | vim - -R
}

preview_bam() {
    if [ $# = 2 ]; then
        file_name=$2
        num_lines=$1
    else
        file_name=$1
        num_lines=1000
    fi
    preview_sam $num_lines <(samtools view $file_name)
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

API_PATH=${HOME}/src

PATH=$HOME/bin:$HOME/local/bin:$HOME/.local/bin:$PATH

export CLASSPATH=/usr/local/bin

export VISUAL=vim
export EDITOR="$VISUAL"
