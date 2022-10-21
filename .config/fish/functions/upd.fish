function upd --wraps='sudo dnf update --refresh' --description 'alias upd sudo dnf update --refresh'
  sudo dnf update --refresh $argv; 
end
