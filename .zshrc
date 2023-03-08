
# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle :compinstall filename '/home/simon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep

# End of lines configured by zsh-newuser-install

LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l);
if [ $LIVE_COUNTER -eq 1 ]; then
	neofetch
fi

# Aliases for some common commands (don't forget to add its 'old' counterpart):
alias ls='exa --icons'
alias lsold='ls'
alias cd='z'
alias cdold='cd'
alias spotify='spotify-launcher'
alias oldspotify='spotify'
alias execmatlab='~/Execs/execmatlab.sh'
# Add the actual directory path:
PS1='%n@%m %~$ '

#add to path:
export PATH="/usr/lib/rstudio/:/home/simon/.local/bin/:$PATH"
# zoxide "init"
eval "$(zoxide init zsh)"

# zsh syntax hl
source /home/simon/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fzf completion and shortcuts
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git  -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git  -g ""'
export FZF_ALT_C_COMMAND='ag --hidden --ignore .git  -g ""'
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'"
eval $(thefuck --alias)
