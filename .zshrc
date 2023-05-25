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
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Plugin options before load
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="  "
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES="_"

# plugins

# HISTORY SUBSTRING SEARCHING
zinit ice atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

zinit ice wait="0" lucid
zinit light zsh-users/zsh-completions

zinit ice wait="0" lucid atload="_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait="0" lucid
zinit light djui/alias-tips

zinit ice wait="0" lucid
zinit light zuxfoucault/colored-man-pages_mod

zinit ice wait="0c" lucid atinit="zpcompinit;zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting


# oh-my-zsh ##############################################
zinit ice wait="0" lucid
zinit snippet OMZP::git
zinit ice wait="0" lucid
zinit snippet OMZP::github
zinit ice wait="0" lucid
zinit snippet OMZP::command-not-found
zinit ice wait="0" lucid
zinit snippet OMZP::sudo
zinit ice wait="0" lucid
zinit snippet OMZP::node
zinit ice wait="0" lucid
zinit snippet OMZP::npm
zinit ice wait="0" lucid
zinit snippet OMZP::python
zinit ice wait="0" lucid
zinit snippet OMZP::docker

# To customize prompt, run `p10k configure` or edit ~/dotfiles/.p10k.zsh.
[[ ! -f ~/dotfiles/.p10k.zsh ]] || source ~/dotfiles/.p10k.zsh
