#!/bin/sh

# nvim
unlink "${HOME}/.config/nvim"
rm -rf "${HOME}/.local/share/nvim"
rm -rf "${HOME}/.local/state/nvim"
rm -rf "${HOME}/.cache/nvim"

# tmux
rm -rf "${HOME}/.tmux"
unlink "${HOME}/.tmux.conf"

# kitty
unlink "${HOME}/.config/kitty"

# emacs
#unlink "${HOME}/.emacs"
#unlink "${HOME}/.emacs.rc"
#rm -f "${HOME}/.emacs.custom.el"
#rm -rf "${HOME}/.emacs.d"
