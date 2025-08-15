# .bashrc

#export EDITOR=micro
export "MICRO_TRUECOLOR=1"
# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

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
# eval "$(atuin init bash --disable-up-arrow)"

#eval "$(fzf --bash)"

source ~/.bash_aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### bling.sh source start
# test -f /usr/share/ublue-os/bling/bling.sh && source /usr/share/ublue-os/bling/bling.sh
### bling.sh source endi
eval "$(starship init bash)"
eval "$(zoxide init bash)"
