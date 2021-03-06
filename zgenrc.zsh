#!/bin/zsh
ZGEN_FOLDER="${HOME}/.zgen"

if [ ! -d $ZGEN_FOLDER ]; then
   echo "Downloading"
   git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi


source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh lib/git
    zgen oh-my-zsh lib/key-bindings
    zgen oh-my-zsh lib/completion
    zgen oh-my-zsh lib/theme-and-appearance
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/globalias
    
    zgen load zsh-users/zsh-completions
    zgen load zsh-users/zsh-autosuggestions
    zgen load djui/alias-tips

    # zgen load denysdovhan/spaceship-prompt
    zgen load rednithin/honukai-iterm-zsh
    
    # zgen load zsh-users/zsh-syntax-highlighting
    zgen load zdharma/fast-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
    
    zgen save
    exec "$SHELL" -l
fi
