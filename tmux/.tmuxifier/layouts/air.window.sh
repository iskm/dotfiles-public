# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/projects/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "air"

# Split window into panes.
split_h 50
split_v 50
#split_v 20
select_pane 1
split_v 50
select_pane 1
run_cmd "echo monitor.sh air.sh at your service"

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1
#run_cmd "zathura ~/Dropbox/Academics/opl/books/sicp.pdf&"
# run_cmd "firefox -no-remote https://docs.racket-lang.org/ &"

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 1
