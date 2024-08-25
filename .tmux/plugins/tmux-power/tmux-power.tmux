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
session_icon="$(tmux_get '@tmux_power_session_icon' '')"
user_icon="$(tmux_get '@tmux_power_user_icon' '')"
time_icon="$(tmux_get '@tmux_power_time_icon' '')"
date_icon="$(tmux_get '@tmux_power_date_icon' '')"
show_network_speed="$(tmux_get @tmux_power_show_network_speed false)"
show_web_reachable="$(tmux_get @tmux_power_show_web_reachable false)"
prefix_highlight_pos=$(tmux_get @tmux_power_prefix_highlight_pos)
time_format=$(tmux_get @tmux_power_time_format '%T')
date_format=$(tmux_get @tmux_power_date_format '%F')

TC="$(tmux_get '@tmux_power_tc' '#ffaf00')" # tmux color
FG="$(tmux_get '@tmux_power_fg' '#b8bb26')" # frontground color
BG="$(tmux_get '@tmux_power_bg' '#0e3744')" # background color
WC="$(tmux_get '@tmux_power_wc' '#0e0e0e')" # word color


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

#     
# Left side of status bar
tmux_set status-left-bg "$BG"
tmux_set status-left-fg "$FG"
tmux_set status-left-length 150
user=$(whoami)
LS="#[fg=$WC,bg=$FG ,bold] $user_icon $user #[fg=$FG,bg=$BG]$rarrow#[fg=$BG,bg=$TC]$rarrow #[fg=$WC,bg=$TC] $session_icon #S #[fg=$TC,bg=$BG]$rarrow"
if [[ $prefix_highlight_pos == 'L' || $prefix_highlight_pos == 'LR' ]]; then
    LS="$LS#{prefix_highlight}"

fi
tmux_set status-left "$LS"

# Right side of status bar
tmux_set status-right-bg "$BG"
tmux_set status-right-fg "$FG"
tmux_set status-right-length 150
RS="#[fg=$BG,bg=$TC]$larrow#[fg=$FG,bg=$BG]$larrow#[fg=$WC,bg=$FG] $date_icon $date_format $time_icon $time_format #[fg=$FG]$larrow"

if "$show_network_speed"; then
    RS="#[fg=$TC,bg=$BG]$larrow#[fg=$WC,bg=$TC,bold] $upload_speed_icon#{upload_speed} $download_speed_icon#{download_speed} $RS"
fi
if "$show_web_reachable"; then
    RS=" #{web_reachable_status} $RS"
fi
if [[ $prefix_highlight_pos == 'R' || $prefix_highlight_pos == 'LR' ]]; then
    RS="#{prefix_highlight}$RS"
fi

tmux_set status-right "$RS"

# Window status format
tmux_set window-status-format         "#[fg=$BG,bg=$TC]$rarrow#[fg=$WC,bg=$TC] #I:#W#F #[fg=$TC,bg=$BG]$rarrow"
tmux_set window-status-current-format "#[fg=$BG,bg=$FG]$rarrow#[fg=$WC,bg=$FG,bold] #I:#W#F #[fg=$FG,bg=$BG,nobold]$rarrow"

# Window status style
tmux_set window-status-style          "fg=$TC,bg=$BG,none"
tmux_set window-status-last-style     "fg=$TC,bg=$BG,bold"
tmux_set window-status-activity-style "fg=$TC,bg=$BG,bold"

# Window separator
tmux_set window-status-separator ""

# Pane border
tmux_set pane-border-style "fg=$FG,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$FG,bg=default"

# Pane number indicator
tmux_set display-panes-colour "$FG"
tmux_set display-panes-active-colour "$TC"

# Clock mode
tmux_set clock-mode-colour "$TC"
tmux_set clock-mode-style 24

# Message
tmux_set message-style "fg=$TC,bg=$BG"

# Command message
tmux_set message-command-style "fg=$TC,bg=$BG"

# Copy mode highlight
tmux_set mode-style "bg=$TC,fg=$BG"
