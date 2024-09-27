#!/bin/bash

set -e

GIT_REPO_URL="https://github.com/mgr-cse/nvim-config"
SRCBRANCH="new"
FONT_URI="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip"

NVIM_CFG_DIR="${HOME}/.config/nvim"

APT_PKGS="tmux git unzip ripgrep"

install_packages() {
	sudo apt install ${APT_PKGS}
	sudo snap install --beta nvim --classic
}

uninstall_packages() {
	sudo apt autoremove ${APT_PKGS}
	sudo snap uninstall nvim
}

install_font() {
	local font_tmp_dir="/tmp/nerd-font-tmp"
	local zip_file

	mkdir -p "${font_tmp_dir}"
	cd "${font_tmp_dir}"
	zip_file="$(basename ${FONT_URI})"
	unzip "${zip_file}"
	rm "${zip_file}"
	mkdir -p "${HOME}/.fonts"
	mv * "${HOME}/.fonts/"
	cd -

	fc-cache -fv
	echo "Nerd fonts installed Please set them in your terminal app."
}

# START
if [ "${EUID}" -eq 0 ]; then
	echo "Don't run as root please."
	exit 1
fi

if [ "$1" = "remove" ]; then
	uninstall_packages
	exit 0
elif [ "$1" = "install_font" ]; then
	install_font
	exit 0
fi

install_packages

mkdir -p "${NVIM_CFG_DIR}"
git clone "${GIT_REPO_URL}" "${NVIM_CFG_DIR}" --branch "${SRCBRANCH}" --single-branch

ln -s "${NVIM_CFG_DIR}/tmux.conf" "${HOME}/.tmux.conf"

echo "Done!"

