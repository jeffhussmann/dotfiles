# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

short_host_names="slate granite cartan ls4 ranger fourierseq"
for name in $short_host_names
do
    if [[ $HOSTNAME =~ $name ]]; then
        short_host_name=$name
    fi
done

PS1_SET_TITLE="\[\e]0;${short_host_name}: \w\a\]"

PS1="${PS1_SET_TITLE}\[\033[01;34m\]\w\[\033[00m\]\$ "

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

API_PATH=${HOME}/src

export PERL5LIB=${HOME}/src/bioperl-1.2.3:${API_PATH}/ensembl/modules:${API_PATH}/ensembl-compara/modules:${API_PATH}/ensembl-variation/modules:${API_PATH}/ensembl-functgenomics/modules
# For compatibility with TACC
if [[ ! $HOSTNAME =~ tacc ]]; then
    export WORK=$HOME
    export SCRATCH=${HOME}/scratch
fi
if [[ $HOSTNAME =~ ls4 ]]; then
    module load python/2.7.1-epd
    PATH=$PATH:$HOME/local/bin
    export LD_LIBRARY_PATH=${HOME}/local/lib/:${LD_LIBRARY_PATH}
fi
if [[ $HOSTNAME =~ stampede ]]; then
    module load python
    PATH=$PATH:$HOME/local/bin
fi
export PYTHONPATH=$PYTHONPATH:$HOME/projects/mutations/code:$HOME/src/biopython-1.60/:$HOME/src/progressbar-2.3/
export CLASSPATH=/usr/local/bin

alias cartan='ssh -X cartan.ices.utexas.edu'
alias slate='ssh -X slate.ices.utexas.edu'
alias granite='ssh -X granite.ices.utexas.edu'
alias lonestar='ssh jahtacc@lonestar.tacc.utexas.edu'
alias stampede='ssh jahtacc@stampede.tacc.utexas.edu'
alias fourier='ssh fourierseq.icmb.utexas.edu'

alias gvim='UBUNTU_MENUPROXY=0 gvim'
