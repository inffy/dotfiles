# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

source ~/.bash_aliases

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

# Bind ctrl-r but not up arrow
eval "$(atuin init bash --disable-up-arrow)"
### bling.sh source start
test -f /usr/share/ublue-os/bling/bling.sh && source /usr/share/ublue-os/bling/bling.sh
### bling.sh source end

# Added by LM Studio CLI (lms)
export PATH="$PATH:/var/home/juha/.lmstudio/bin"
# End of LM Studio CLI section

export GPG_TTY=$(tty)
export GTK_IM_MODULE=simple
#enable zoxide
eval "$(zoxide init bash)"
