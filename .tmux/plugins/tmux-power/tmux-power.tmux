#!/usr/bin/env bash
#===============================================================================
#   Author: Wenxuan
#    Email: wenxuangm@gmail.com
#  Created: 2018-04-05 17:37
#===============================================================================

# $1: option
# $2: default value
tmux_get() {
    local value="$(tmux show -gqv "$1")"
    [ -n "$value" ] && echo "$value" || echo "$2"
}

# $1: option
# $2: value
tmux_set() {
    tmux set-option -gq "$1" "$2"
}

# Options
rarrow=$(tmux_get '@tmux_power_right_arrow_icon' '')
larrow=$(tmux_get '@tmux_power_left_arrow_icon' '')
upload_speed_icon=$(tmux_get '@tmux_power_upload_speed_icon' '󰕒')
download_speed_icon=$(tmux_get '@tmux_power_download_speed_icon' '󰇚')
session_icon="$(tmux_get '@tmux_power_session_icon' '')"
user_icon="$(tmux_get '@tmux_power_user_icon' '')"
time_icon="$(tmux_get '@tmux_power_time_icon' '')"
date_icon="$(tmux_get '@tmux_power_date_icon' '')"
show_whoami="$(tmux_get @tmux_power_show_whoami false)"
show_network_speed="$(tmux_get @tmux_power_show_network_speed false)"
show_web_reachable="$(tmux_get @tmux_power_show_web_reachable false)"
prefix_highlight_pos=$(tmux_get @tmux_power_prefix_highlight_pos)
time_format=$(tmux_get @tmux_power_time_format '%T')
date_format=$(tmux_get @tmux_power_date_format '%F')

TC="$(tmux_get '@tmux_power_tc' '#FFAF00')"  # tmux color
FG="$(tmux_get '@tmux_power_fg' '#B8BB26')"  # front color
BG="$(tmux_get '@tmux_power_bg' '#0E3744')"  # background color
C0="$(tmux_get '@tmux_power_c0' '#0E0E0E')"  # word color
C1="$(tmux_get '@tmux_power_c1' '#B8BB26')"  # whoami bg
C2="$(tmux_get '@tmux_power_c2' '#FFAF00')"  # session bg
C3="$(tmux_get '@tmux_power_c3' '#E0E0E0')"  # window status fg
C4="$(tmux_get '@tmux_power_c4' '#E0E0E0')"  # current window status bg
C5="$(tmux_get '@tmux_power_c5' '#B8BB26')"  # netspeed bg
C6="$(tmux_get '@tmux_power_c6' '#B8BB26')"  # datetime bg


# Status options
tmux_set status-interval 1
tmux_set status on

# Basic status bar colors
tmux_set status-fg "$FG"
tmux_set status-bg "$BG"
tmux_set status-attr none

# tmux-prefix-highlight
tmux_set @prefix_highlight_fg "$BG"
tmux_set @prefix_highlight_bg "$FG"
tmux_set @prefix_highlight_show_copy_mode 'on'
tmux_set @prefix_highlight_copy_mode_attr "fg=$FG,bg=$BG,bold"
tmux_set @prefix_highlight_output_prefix "#[fg=$FG]#[bg=$BG]$larrow#[bg=$FG]#[fg=$BG]"
tmux_set @prefix_highlight_output_suffix "#[fg=$FG]#[bg=$BG]$rarrow"

     
# Left side of status bar
tmux_set status-left-bg "$BG"
tmux_set status-left-fg "$FG"
tmux_set status-left-length 150
if "$show_whoami"; then
	user=$(whoami)
	LS="#[fg=$C0,bg=$C1 ,bold] $user_icon $user #[fg=$C1,bg=$BG]$rarrow#[fg=$BG,bg=$C2]$rarrow"
fi

LS="$LS#[fg=$C0,bg=$C2] $session_icon #S #[fg=$C2,bg=$BG]$rarrow"

if [[ $prefix_highlight_pos == 'L' || $prefix_highlight_pos == 'LR' ]]; then
    LS="$LS#{prefix_highlight}"

fi
tmux_set status-left "$LS"

# Right side of status bar
tmux_set status-right-bg "$BG"
tmux_set status-right-fg "$FG"
tmux_set status-right-length 150
RS="#[fg=$C6,bg=$BG]$larrow#[fg=$C0,bg=$C6] $date_icon $date_format $time_icon $time_format#[fg=$C6]$larrow"

if "$show_network_speed"; then
    RS="#[fg=$C5,bg=$BG]$larrow#[fg=$C0,bg=$C5] $upload_speed_icon#{upload_speed} $download_speed_icon#{download_speed} #[fg=$BG,bg=$C5]$larrow$RS"
fi
if "$show_web_reachable"; then
    RS=" #{web_reachable_status} $RS"
fi
if [[ $prefix_highlight_pos == 'R' || $prefix_highlight_pos == 'LR' ]]; then
    RS="#{prefix_highlight}$RS"
fi

tmux_set status-right "$RS"

# Window status format
tmux_set window-status-format         "#[fg=$BG,bg=$BG]$rarrow#[fg=$C3,bg=$BG] #I:#W#F #[fg=$BG,bg=$BG]$rarrow"
tmux_set window-status-current-format "#[fg=$BG,bg=$C4]$rarrow#[fg=$C0,bg=$C4,bold] #I:#W#F #[fg=$C4,bg=$BG,nobold]$rarrow"

# Window status style
tmux_set window-status-style          ""
tmux_set window-status-last-style     ""
tmux_set window-status-activity-style ""

# Window separator
tmux_set window-status-separator ""

# Pane border
tmux_set pane-border-style "fg=default,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$TC,bg=default"

# Pane number indicator
tmux_set display-panes-colour "default"
tmux_set display-panes-active-colour "$TC"

# Clock mode
tmux_set clock-mode-colour "$TC"
tmux_set clock-mode-style 24

# Message
tmux_set message-style "fg=$TC,bg=$BG"

# Command message
tmux_set message-command-style "fg=$TC,bg=$BG"

# Copy mode highlight
tmux_set mode-style "fg=$C0,bg=$TC"
