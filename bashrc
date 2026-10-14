#!/bin/bash

unamestr=$(uname)

if [[ "$unamestr" == 'Linux' ]]; then
    setxkbmap -layout gb -option ctrl:nocaps
    alias ssteam="STEAM_RUNTIME=0 steam"
    alias upgrade="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && cabal update && sudo snap refresh"
fi
alias rload="export RSTUDIO_WHICH_R=~/.homebrew/bin/R; cd $HOME/Desktop/RStudio.app/Contents/MacOS/; ./RStudio "

alias tmux="TERM=screen-256color-bce tmux"


export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.homebrew/bin:$PATH
export PATH=$HOME/.local/bin/git-annex:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin/Elm-Platform/0.15.1/.cabal-sandbox/bin:$PATH
export PATH=$HOME/.roswell/bin:$PATH
export RUST_SRC_PATH=$HOME/git_repos/rust/src
export PATH=~/.npm-global/bin:$PATH

#. $HOME/.nix-profile/etc/profile.d/nix.sh

#alias cabalNixRegen="nix-shell -p cabal2nix --run \"cabal2nix . > default.nix\""

alias clean-git="git branch | grep -v '^*' | xargs git branch -d"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

source "$HOME/.secrets.sh"
. "$HOME/.cargo/env"

function rdss-header {
  OFFSET=$(head -c 4 $1 | od -t d4 -An --endian=big);
  tail -c +5 $1 | head -c $OFFSET | jq
}

function pretty-json {
  for d in $@; do
      echo "Making $d pretty"
      cat $d | jq . > $d.pretty && mv $d.pretty $d;
  done
}

function pretty-xml {
  for d in $@; do
      echo "Making $d pretty";
      xmllint --format $d > $d.pretty && mv $d.pretty $d;
  done
}

function fix-docker {
    sudo ln -s $HOME/.docker/run/docker.sock /var/run/docker.sock
}



# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/edward/.lmstudio/bin"
# End of LM Studio CLI section

