export PATH=~/Dropbox/dev/bin:/usr/local/bin:/usr/local/sbin:$PATH
#export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#export HISTCONTROL=ignoreboth
export EDITOR='vim'
export RUBYOPT=rubygems
export CC=gcc-4.2

# Aliases #######
alias zrc='vim ~/.zshrc'
alias dev='cd ~/Dropbox/dev'
alias vrf='rm ~/.vim/tmp/*/*&rm ~/.vim/session/session.vim'
alias v='mvim'

# zshrc init ####
ZSH=$HOME/.oh-my-zsh
plugins=(git osx ruby brew vundle)
source $ZSH/oh-my-zsh.sh

# Theme #########
function get_pwd() {
    local PRE= NAME="$PWD" LENGTH="54";
    [[ "$NAME" != "${NAME#$HOME/}" || -z "${NAME#$HOME}" ]] &&
        PRE+='~' NAME="${NAME#$HOME}" LENGTH=$[LENGTH-1];
    ((${#NAME}>$LENGTH)) && NAME="/...${NAME:$[${#NAME}-LENGTH+4]}";
    echo "$PRE$NAME"
}

function put_spacing() {
    local git=$(git_prompt_info)
    if [ ${#git} != 0 ]; then
        ((git=${#git} - 20))
    else
        git=0
    fi

    local termwidth
    (( termwidth = 4 + ${COLUMNS} - ${#HOST} - ${#$(get_pwd)} - ${git} ))

    local spacing=""
    for i in {1..$termwidth}; do
        spacing="${spacing} " 
    done
    echo $spacing
}

function git_prompt_info() {   
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='
$bg[grey]$FX[bold]$fg[cyan]%m$fg[white]: $fg[yellow]$(get_pwd)$(put_spacing)$(git_prompt_info)$reset_color
→ '
#RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="$bg[black]$fg[white]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[grey]"

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
