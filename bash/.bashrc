# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

if [[ -f $HOME/.bash_profile ]]; then
    source $HOME/.bash_profile
fi

# work around for fzf
set -o vi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# powerline settings
# if [ -f `which powerline-daemon`  ]; then
   # powerline-daemon -q
   # POWERLINE_BASH_CONTINUATION=1
   # POWERLINE_BASH_SELECT=1
# fi

# if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh  ]; then
       # source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
# fi

# not needed torch now intalled via digits
# start tmux or attach to a current session on startup
# tmux attach -t home|| tmux new -s home
# source ~/.autoenv/activate.sh
# tmux attach -t home || tmux new -s home

# tmuxifier
eval "$(tmuxifier init -)"

# . /home/pcuser/torch/install/bin/torch-activate

# added by Anaconda3 4.2.0 installer
# export PATH="/home/pcuser/anaconda3/bin:$PATH"

# added by Anaconda2 4.2.0 installer
export PATH="$HOME/anaconda2/bin:$PATH"

# direnv
eval "$(direnv hook bash)"
# zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mango/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mango/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mango/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mango/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
