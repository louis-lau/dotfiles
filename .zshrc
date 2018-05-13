# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# If locale is emtpy set it to en_US
if [ -z "$LC_ALL" ]; then
  export LC_ALL=en_US.UTF-8
fi
if [ -z "$LANG" ]; then
  export LANG=en_US.UTF-8
fi
if [ -z "$LANGUAGE" ]; then
  export LANGUAGE=en_US.UTF-8
fi
if [ $LANG = "C" ]; then
  export LANG=en_US.UTF-8
fi

# zplug plugins
source ~/.zplug/init.zsh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "djui/alias-tips"
zplug "Tarrasch/zsh-bd"
zplug "zuxfoucault/colored-man-pages_mod"
zplug "hlissner/zsh-autopair", defer:2
zplug "robertzk/send.zsh"
zplug "zsh-users/zsh-syntax-highlighting"

# Powerlevel9k options
POWERLEVEL9K_DISABLE_RPROMPT=true
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context root_indicator dir dir_writable rbenv vcs)
POWERLEVEL9K_MODE='nerdfont-complete'

# Alias-tips options
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="  "
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES="_"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load

# Specify oh-my-zsh plugins
plugins=(
  git
  command-not-found
  sudo
)

source $ZSH/oh-my-zsh.sh

### Bashhub.com Installation
if [ -f ~/.bashhub/bashhub.zsh ]; then
    source ~/.bashhub/bashhub.zsh
fi
