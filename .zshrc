stty stop undef		# Disable ctrl-s to freeze terminal.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt autocd cdablevars histignorealldups nomatch menucomplete

zle_highlight=('paste:none')

# completions
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.
# zoxide
eval "$(zoxide init zsh)"
# atuin
eval "$(atuin init zsh --disable-up-arrow)"
# starship
# eval "$(starship init zsh)"

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Useful Functions to source files and plugins
source "$ZDOTDIR/zsh-functions"
source "$ZDOTDIR/plugins/zsh-async/async.zsh"
source "$ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "romkatv/powerlevel10k"

# source files
zsh_add_file "zsh-exports"
# zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
# zsh_add_file "zsh-prompt"
zsh_add_file "zsh-misc-config"

#Themes
# zsh_add_theme "dracula/zsh"

# Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/Sync/allen/zsh/.p10k.zsh.
[[ ! -f ~/Sync/allen/zsh/.p10k.zsh ]] || source ~/Sync/allen/zsh/.p10k.zsh

# bun completions
[ -s "/home/allen/.bun/_bun" ] && source "/home/allen/.bun/_bun"
