home = $(shell (echo $$HOME))
pwd =  $(shell pwd)

all: bash vim xmonad xmobar xresources

powerline_fonts:
	git clone https://github.com/powerline/fonts
	bash powerline/install.sh

bash:
	ln -sf $(pwd)/bashrc $(home)/.bashrc
	ln -sf $(pwd)/bash_profile $(home)/.bash_profile

programs: 
	sudo apt install -y ghc vim xmobar happy alex feh rxvt-unicode libx11-dev libxft-dev cabal-install libxrandr-dev
	cabal update
	cabal install xmonad xmonad-extras

xresources:
	ln -sf $(pwd)/Xresources $(home)/.Xresources
	xrdb -merge $(home)/.Xresources

xmobar:
	ln -sf $(pwd)/xmobarrc $(home)/.xmobarrc

$(home)/.emacs.d:
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

emacs: $(home)/.emacs.d
	yaourt -S --needed emacs25-git
	ln -sf $(pwd)/spacemacs $(home)/.spacemacs

$(home)/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git $(home)/.vim/bundle/Vundle.vim

vim: $(home)/.vim/bundle/Vundle.vim
	ln -sf $(pwd)/vimrc $(home)/.vimrc
	vim +PluginInstall +qall

xmonad: programs 
	mkdir -p $(home)/.xmonad
	mkdir -p $(home)/.xmonad/lib
	cabal install xmonad xmonad-extras
	ln -sf $(pwd)/Solarized.hs $(home)/.xmonad/lib
	ln -sf $(pwd)/xmonad.hs $(home)/.xmonad
	ln -sf $(pwd)/wallpaper.png $(home)/.image
	xmonad --recompile
