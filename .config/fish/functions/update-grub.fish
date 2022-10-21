function update-grub --wraps='sudo grub2-mkconfig -o /etc/grub2-efi.cfg' --description 'alias update-grub sudo grub2-mkconfig -o /etc/grub2-efi.cfg'
  sudo grub2-mkconfig -o /etc/grub2-efi.cfg $argv; 
end
