# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.


for file in ~/.{bash_prompt,aliases,functions,path,extra,exports}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# probleming in vnc settings
# [ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] && exec startx
# if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	# exec startx
# fi

# solarized directory color listings
eval `dircolors $HOME/.dir_colors`
# xrdb ~/.Xresources

# tmuxifier
# eval "$(tmuxifier init -)"

# source torch
# . /home/pcuser/torch/install/bin/torch-activate
# if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  # exec startx
# fi

