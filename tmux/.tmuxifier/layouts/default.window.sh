# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Dropbox/Academics/opl/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "racket"

# Split window into panes.
# split_h 70
# select_pane 1
# split_v 30
split_v 20
# select_pane 0

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1
run_cmd "zathura ~/Dropbox/Academics/opl/books/sicp.pdf&"
# run_cmd "firefox -no-remote https://docs.racket-lang.org/ &"

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 1
