# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

# -----------------------------------------------------
# General
# -----------------------------------------------------

alias ff='fastfetch'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# -----------------------------------------------------
# Git
# -----------------------------------------------------
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"

#
# Podman
#
alias build_aurora='sudo just build aurora-dx'
alias ptag='sudo podman tag localhost/aurora-dx:latest' 
alias switch='sudo bootc switch --transport containers-storage'
