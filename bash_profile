# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/edward/.docker/bin"
# End of Docker Desktop section.

#
# ~/.bash_profile
#

export CLIENT_PORTAL_JENKINS_PASSWORD=11b6bdecf1bafe5e909a299da1ac559047

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -e /home/edward/.nix-profile/etc/profile.d/nix.sh ]; then . /home/edward/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


export LEIN_USERNAME="ci"
export LEIN_PASSWORD="ZE80MnQzUGs4S0R2ZTlldw=="
. "$HOME/.cargo/env"


# Make docker containers on M1 always run linux amd64
# https://docs.docker.com/engine/reference/commandline/cli/
export DOCKER_DEFAULT_PLATFORM="linux/amd64"

# buildkit is not very good.
# https://stackoverflow.com/questions/64221861/an-error-failed-to-solve-with-frontend-dockerfile-v0
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

export PATH="$HOME/.elan/bin:$PATH"

export CR_PAT=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

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/edward/.lmstudio/bin"
# End of LM Studio CLI section

