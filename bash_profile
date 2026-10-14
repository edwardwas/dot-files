
# buildkit is not very good.
# https://stackoverflow.com/questions/64221861/an-error-failed-to-solve-with-frontend-dockerfile-v0
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/edward/.lmstudio/bin"
# End of LM Studio CLI section

