# Init ZSH #####
ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="kardan"

plugins=(git osx ruby brew vundle)
source $ZSH/oh-my-zsh.sh

# ZSH OPTIONS ##
COMPLETION_WAITING_DOTS="true"

# Path #########
export PATH=~/Dropbox/dev/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Options ######
export EDITOR='vim'
export RUBYOPT=rubygems
export CC=gcc-4.2
export CPPFLAGS=-I/opt/X11/include

# Aliases ######
alias dev='cd ~/Dropbox/dev'
alias v='mvim'
alias noss='defaults write -g ApplePressAndHoldEnabled -bool false'

# Prompt #######
function get_host {
	echo ' @ '`hostname`''
}

PROMPT="
%{$FX[bold]%}%{$fg[cyan]%}%{$BG[234]%}$ "
RPROMPT="%~$(git_prompt_info)$(get_host)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"

# ENV ##########
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
