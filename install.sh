# vim and for root
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.vim /root/.vim
ln -s ~/.vimrc /root/.vimrc

# portage
sudo ln -s ~/dotfiles/etc/portage /etc/portage
# resetting the profile link 
sudo eselect profile set 6

# /etc/fstab
ln -s ~/dotfiles/etc/fstab /etc/fstab

# 


# for oh-my-zsh
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

# for config files
ln -s ~/.dotfiles/config/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/config/gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/config/ssh ~/.ssh




