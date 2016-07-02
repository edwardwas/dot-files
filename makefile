home = $(shell (echo $$HOME))
pwd =  $(shell pwd)

all: vim xmonad

vim:
	ln -sf $(pwd)/vimrc $(home)/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git $(home)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

xmonad:
	mkdir -p $(home)/.xmonad
	mkdir -p $(home)/.xmonad/lib
	cabal install xmonad xmonad-extras
	ln -sf $(pwd)/Solarized.hs $(home)/.xmonad/lib
	ln -sf $(pwd)/xmonad.hs $(home)/.xmonad
	xmonad --recompile
