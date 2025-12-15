if status is-interactive
	set -g fish_greeting

	zoxide init fish | source

	alias ls="eza --header --group-directories-first --icons"
	alias tree="eza --tree --group-directories-first --icons --long"
end
