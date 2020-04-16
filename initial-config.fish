#!/usr/bin/env fish

fish_vi_key_bindings
abbr s 'sed -nr \'s///p'\'
set -U fish_user_paths ~/.local/anaconda3/bin ~/.local/bin 
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_COMPLETE 3
