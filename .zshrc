# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f ${HOME}/.zplug/init.zsh ]; then
    source ${HOME}/.zplug/init.zsh
fi

source ~/.aliases

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

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# zplug plugins
source ~/.zplug/init.zsh
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "djui/alias-tips"
zplug "Tarrasch/zsh-bd"
zplug "zuxfoucault/colored-man-pages_mod"
zplug "hlissner/zsh-autopair", defer:2
zplug "robertzk/send.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "trapd00r/LS_COLORS"
zplug "jreese/zsh-titles"

# oh-my-zsh ##############################################
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/lein", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/compleat", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

# Alias-tips options
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="  "
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES="_"

# Npm shit
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load

# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
