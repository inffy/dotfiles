#/bin/bash
set -eux

# Don't run this script as root
[ ! "$UID" -eq 0 ] || { echo "This script must not be run as root."; exit 1;}

echo "Change to Projects dir"
cd ~/Projects

echo "Install nord theme for Gnome-terminal"
cd ~/Projects
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src

echo "Installing to default profile"
./nord.sh -p default

echo "Switch using ZSH instead of bash"
cd ~/Projects/dotfiles

echo "Copy oh-my-zsh confs to home"
cp -r .oh-my-zsh ~/

cd zsh

echo "Copy zsh and p10k configs to home"
cp .zshrc ~/
cp .p10k.zsh ~/

echo "change shell to zsh"
sudo usermod -s /bin/zsh juha

echo "Install needed fonts"
cd ~/Projects/dotfiles
# Fonts
#
# NerdFonts are basically fonts with a more rich set of emojis embeded
mkdir -p ~/.local/share/fonts
curl -sfLo "$HOME/.local/share/fonts/Ubuntu Mono Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf
curl -sfLo "$HOME/.local/share/fonts/Ubuntu Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Ubuntu/Regular/complete/Ubuntu%20Nerd%20Font%20Complete.ttf
cp -R fonts/ubuntu-font-family/*.ttf $HOME/.local/share/fonts/
cp -R fonts/meslo/*.ttf $HOME/.local/share/fonts/
# Flush font cache
fc-cache

# Get current profile for terminal, and update the font
current_profile=$(dconf list /org/gnome/terminal/legacy/profiles:/ | head -n1)
# TODO(mc): We /could/ prompt the user if they want to keep the current font, use Ubuntu Mono, or Ubuntu Mono Nerd Font?
dconf write /org/gnome/terminal/legacy/profiles:/${current_profile}use-system-font false
dconf write /org/gnome/terminal/legacy/profiles:/${current_profile}font "'MesloLGS NF 10'"

echo "Done, please reboot!"
