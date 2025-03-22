#!/bin/sh

# nvim
if [ ! -d nvim ]; then
	echo "nvim config directory not found!"
	echo "Perhaps you want to update submodules"
	exit 1
fi

mkdir -p "${HOME}/.config"
ln -sf "$(realpath nvim)" "${HOME}/.config/nvim"

# tmux
mkdir -p "${HOME}/.tmux/plugins"
git clone https://github.com/tmux-plugins/tpm \
	"${HOME}/.tmux/plugins/tpm" \
	--depth=1 --branch=master

ln -sf "$(realpath tmux.conf)" "${HOME}/.tmux.conf"

# kitty
ln -sf "$(realpath kitty)" "${HOME}/.config/kitty"
