unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
    setxkbmap -layout gb -option ctrl:nocaps
    alias ssteam="STEAM_RUNTIME=0 steam"
fi

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.homebrew/bin:$PATH
export PATH=$HOME/.local/bin/git-annex:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin/Elm-Platform/0.15.1/.cabal-sandbox/bin:$PATH
export RUST_SRC_PATH=$HOME/git_repos/rust/src
