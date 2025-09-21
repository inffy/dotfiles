#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
# -----------------------------------------------------

# You can define your custom configuration by adding
# files in ~/.config/zshrc
# or by creating a folder ~/.config/zshrc/custom
# with you own zshrc configuration
# -----------------------------------------------------


if [ -d ~/.config/zshrc/custom ]; then
    for f in ~/.config/zshrc/custom/*; do source $f; done
else
    for f in ~/.config/zshrc/*; do source $f; done
fi

### bling.sh source start
# test -f /usr/share/ublue-os/bling/bling.sh && source /usr/share/ublue-os/bling/bling.sh
### bling.sh source end
# Bind ctrl-r but not up arrow
#eval "$(atuin init zsh --disable-up-arrow --disable-ctrl-r)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/juha/.lmstudio/bin"
# End of LM Studio CLI section


# Added by LM Studio CLI (lms)
export PATH="$PATH:/var/home/juha/.lmstudio/bin"
# End of LM Studio CLI section


# bun completions
[ -s "/var/home/juha/.bun/_bun" ] && source "/var/home/juha/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
