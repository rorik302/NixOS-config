if status is-interactive
	set -g fish_greeting

	zoxide init fish | source
	fzf --fish | source

	set -x FZF_DEFAULT_OPTS "--exact --ansi --style full --layout reverse --height 35% --info inline"
	set -x FZF_DEFAULT_COMMAND "fd --hidden --follow --color always --exclude='**/.git'"
	set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND "--type f"
	set -x FZF_CTRL_T_OPTS "--preview 'bat --color always --style numbers {}'"
	set -x FZF_ALT_C_COMMAND $FZF_DEFAULT_COMMAND "--type d"


	bind \cg fzfrg

	alias ls="eza --header --group-directories-first --icons"
	alias tree="eza --tree --group-directories-first --icons --long"
end
