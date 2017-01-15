[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias ls='ls -G'

# If there is a bin directory in the users home add it to path
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

# If bash completion is installed source it
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

if [ -f $(brew --prefix)/etc/chruby ]; then
  . /usr/local/share/chruby/chruby.sh
  . /usr/local/share/chruby/auto.sh
  chruby 2.0
fi

# git status in prompt
source ~/.git-prompt.sh

# prompt
PS1_COLOR_RESET="\[\e[0m\]"
PS1_DIRECTORY="\[\e[00;37m\] \w> "
PS1_GIT_BRANCH="\[\e[0;35m\]\$(__git_ps1)"
#PS1_RUBY_VERSION="\[\e[0;34m\]{\$(ruby --version | sed 's/ (.*//')}"

PS1_COMBINED=""
#PS1_COMBINED+=$PS1_RUBY_VERSION
PS1_COMBINED+=$PS1_GIT_BRANCH
PS1_COMBINED+=$PS1_DIRECTORY
PS1_COMBINED+=$PS1_COLOR_RESET

export PS1=$PS1_COMBINED

#set default bash editor to vim
export VISUAL=vim
export EDITOR="$VISUAL"
