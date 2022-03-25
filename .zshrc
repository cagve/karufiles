if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	  exec startx
fi

export VISUAL=nvim
export EDITOR=nvim
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

export PATH="$PATH:~/.local/bin/"
export PATH="$PATH:~/scripts"
export PATH="$PATH:$GEM_HOME/bin"

alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
autoload -U colors && colors	# Cargar colores
# Prompt >> lukesmith <3
PROMPT=' %B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$ %b'
RPROMPT='${vcs_info_msg_0_}'


