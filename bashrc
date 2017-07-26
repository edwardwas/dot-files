#!/bin/bash

unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
    setxkbmap -layout gb -option ctrl:nocaps
    alias ssteam="STEAM_RUNTIME=0 steam"
    alias upgrade="sudo apt update && sudo apt upgrade -y && cabal update"
fi
alias rload="export RSTUDIO_WHICH_R=~/.homebrew/bin/R; cd $HOME/Desktop/RStudio.app/Contents/MacOS/; ./RStudio "

function toMp3 {
    ffmpeg -i "$1" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "${1%.*}.mp3"
}


export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.homebrew/bin:$PATH
export PATH=$HOME/.local/bin/git-annex:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin/Elm-Platform/0.15.1/.cabal-sandbox/bin:$PATH
export RUST_SRC_PATH=$HOME/git_repos/rust/src
