if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	  exec startx
fi

export VISUAL=nvim
export EDITOR=nvim
export PDF_PATH=$HOME/Documents/Pdfs/
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

export PATH=~/.local/bin/:$PATH
export PATH=~/.cargo/bin/:$PATH
export PATH=~/scripts:$PATH
export PATH=$GEM_HOME/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib/tree-sitter/build/:$LD_LIBRARY_PATH


alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias spotify='LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify'

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
autoload -U colors && colors	# Cargar colores
# Prompt >> lukesmith <3
PROMPT=' %B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$ %b'
RPROMPT='${vcs_info_msg_0_}'


ga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}
