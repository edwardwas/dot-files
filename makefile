all: xmonad


xmonad:
	mkdir -p $HOME/.xmonad
	mkdir -p $HOME/.xmonad/lib
	cabal install xmonad xmonad-extras
	ln -sf $(pwd)/Solarized.hs $HOME/.xmonad/lib
	ln -sf $(pwd)/xmonad.hs $HOME/.xmonad
	xmonad --recompile
