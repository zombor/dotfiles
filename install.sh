#!/usr/bin/env zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s ~/.dotfiles/.zprezto ~/.zprezto
ln -s ~/.dotfiles/.zprezto/runcoms/zshrc ~/.zshrc
ln -s ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc

# Vim
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc

ln -s ~/.dotfiles/.i3 ~/.config/i3
ln -s ~/.dotfiles/.polybar ~/.config/polybar
ln -s ~/.dotfiles/.termite ~/.config/termite

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
