# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

define_keymap(re.compile("firefox-esr|brave-browser|Firefox|Google-chrome"), {
    # Ctrl+Alt+j/k to switch next/previous tab
    K("C-M-j"): K("C-TAB"),
    K("C-M-k"): K("C-Shift-TAB"),
    # Ctrl+Alt+j/k to switch next/previous tab
    K("C-M-j"): K("C-TAB"),
    K("C-M-k"): K("C-Shift-TAB"),
    # Type C-j to focus to the content
    K("C-j"): K("C-f6"),

}, "Browsers")

define_keymap(lambda wm_class: wm_class not in ("kitty", "tmux"), {
    K("Ctrl-x"): { K("C-x"): K("C-x") },
    K("Ctrl-a"): { K("C-a"): K("C-a") }
}, "prefix-binding keys")

define_keymap(lambda wm_class: wm_class not in ("kitty", "tmux"), {
    # Ctrl+d to close tab
    # Ctrl+w/h to delete a word/letter
    K("C-w"): K("C-Backspace"),
    K("C-h"): K("Backspace"),
    # Ctrl+a  moves the cursor to the beginning of a line
    # Ctrl+e  moves the cursor to the end of a line
    K("C-a"): K("Home"),
    K("C-e"): K("End"),
    K("C-t"): K("C-w"),
    K("C-d"): K("C-t"),
    # Ctrl+Shift+a to select all context
}, "Terminal-like keys")
