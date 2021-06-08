# +-------------------------------------------+
# | ZSH CONFIG FILE ---by-Sebastian-Dorobantu |
# +-------------------------------------------+

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/seba/.config/ohmyzsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.con
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=23
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
plugins=(
    git
    python
    alias-tips
    )

fpath+=${ZDOTDIR:-~}/.zsh_functions
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh
###########User configuration###################################################


####EXPORTS#####################################################################

export LANG=en_US.UTF-8
export EDITOR='nvim'
export HISTCONTROL='erasedups'
export HISTORY_IGNORE='ls*:cd*:top:ranger'
export DROPBOX='/home/seba/Dropbox'

#nvim as manpager####
export MANPAGER="nvim -c 'set ft=man' -"

setopt HIST_IGNORE_DUPS

####KEYBINDS#########################

# ctrl-left and ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
# ctrl-bs and ctrl-del
bindkey "\e[3;5~" kill-word
bindkey "\C-_"    backward-kill-word
# del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
# alt-bs
bindkey "\e\d"  undo
# Reverse search
bindkey '^R' history-incremental-search-backward



###ALIASES############################

# LS ###
alias ls='lsd'
alias ll='ls -l'
alias la='ls -la'
alias lt='ls --tree --depth'
alias l.='ls -la |egrep "^\."'

# Navigation
alias cd..='cd ..'
alias cd...='cd ../..'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -I'
alias rmf='rm -dfr'

## Get top process eating memory & cpu
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Programs
alias vim='nvim'
alias matrix='cmatrix'
alias top='htop'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias journalctl='journalctl --no-hostname'
alias cat='bat'

# The terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Power
alias hibernate='systemctl hibernate'
alias shutdown='systemctl poweroff'
alias poweroff='systemctl poweroff'
alias restart='systemctl reboot'
alias reboot='systemctl reboot'
alias down='systemctl poweroff'
alias sleep='systemctl sleep'
alias :Q="exit"
alias :q="exit"

# Pacman
alias yeet='sudo pacman -Rn'
alias yoink='sudo pacman -S'
alias zoinks='sudo pacman -Syyyu'
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock

# Shortcuts
alias 3mon='xrandr --output HDMI-1 --auto;xrandr --output HDMI-1 --same-as HDMI-0'
alias ww='nvim $DROPBOX/wiki/index.md'


######EXTRACTOR#################################################################

# ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}



######START#####################################################################

neofetch
