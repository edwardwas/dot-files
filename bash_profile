#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -e /home/edward/.nix-profile/etc/profile.d/nix.sh ]; then . /home/edward/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
