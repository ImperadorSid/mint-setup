#!/usr/bin/env fish

fish_vi_key_bindings
abbr s 'sed -nr \'s///p'\'
set -U fish_user_paths ~/.local/anaconda3/bin ~/.local/bin 
set -U FZF_COMPLETE 1
set -U FZF_DEFAULT_OPTS '--height 20 --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
set -U FZF_LEGACY_KEYBINDINGS 0
