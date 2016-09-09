unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
    setxkbmap -layout gb -option ctrl:nocaps
    alias ssteam="STEAM_RUNTIME=0 steam"
fi

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.homebrew/bin
export PATH=$PATH:$HOME/.local/bin/git-annex
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin/Elm-Platform/0.15.1/.cabal-sandbox/bin
export RUST_SRC_PATH=$HOME/git_repos/rust/src
