# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

# -----------------------------------------------------
# General
# -----------------------------------------------------
alias just='ujust'
alias c='clear'
alias nf='fastfetch'
alias pf='fastfetch'
alias ff='fastfetch'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
alias vim='$EDITOR'
alias ts='~/.config/ml4w/scripts/snapshot.sh'
alias wifi='nmtui'
alias cleanup='~/.config/ml4w/scripts/cleanup.sh'
alias vim='nvim'
alias lg='lazygit'

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

# -----------------------------------------------------
# Podman
#-----------------------------------------------------
alias build_aurora='sudo just build aurora'
alias build_auroradx='sudo just build aurora-dx'
alias ptag='sudo podman tag localhost/aurora-dx:latest'
alias switch='sudo bootc switch --transport containers-storage'

# -----------------------------------------------------
# Aurora
# -----------------------------------------------------
alias update='sudo bootc update'
alias upd='update'
alias status='rpm-ostree status'
alias fpu='flatpak update'
