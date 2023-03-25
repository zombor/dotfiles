#!/usr/bin/env zsh

ZPREZTODIR="${ZDOTDIR:-$HOME}/.zprezto"

if [ -d "${ZPREZTODIR}" ]; then
  cd "${ZPREZTODIR}"
  git fetch origin
  git reset --hard origin/master
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -sf ~/.dotfiles/.zprezto/runcoms/zshrc ~/.zshrc
ln -sf ~/.dotfiles/.zprezto/runcoms/zpreztorc ~/.zpreztorc

# Vim
mkdir -p ~/.vim
ln -sf ~/.dotfiles/.vim/.vimrc ~/.vimrc

# nerdtree
if [ -d "${HOME}/.vim/pack/vendor/start/nerdtree" ]; then
  cd ~/.vim/pack/vendor/start/nerdtree
  git fetch origin
  git reset --hard origin/master
else
  git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
  vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
fi

# vim-go
if [ -d "${HOME}/.vim/pack/plugins/start/vim-go" ]; then
  cd ~/.vim/pack/plugins/start/vim-go
  git fetch origin
  git reset --hard origin/master
else
  git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
fi

# vim-airline
if [ -d "${HOME}/.vim/pack/dist/start/vim-airline" ]; then
  cd ~/.vim/pack/dist/start/vim-airline
  git fetch origin
  git reset --hard origin/master
else
  git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
fi

# vim-ledger
if [ -d "${HOME}/.vim/pack/ledger/start" ]; then
  cd ~/.vim/pack/ledger/start
  git fetch origin
  git reset --hard origin/master
else
  mkdir -p ~/.vim/pack/ledger/start
  cd ~/.vim/pack/ledger/start
  git clone https://github.com/ledger/vim-ledger.git
fi

rm -rf ${ZPREZTODIR}/contrib/fzf-tab && git clone https://github.com/Aloxaf/fzf-tab ${ZPREZTODIR}/contrib/fzf-tab
rm -rf ${ZPREZTODIR}/contrib/fzf-tab-source && git clone https://github.com/Freed-Wu/fzf-tab-source.git ${ZPREZTODIR}/contrib/fzf-tab-source

ln -sf ~/.dotfiles/.tmux.conf.local ${HOME}/.tmux.conf.local
