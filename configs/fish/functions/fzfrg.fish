function fzfrg
	set -l current_command (commandline)
	set -l RG_PREFIX "rg --column --line-number --no-heading --color=always --smart-case"
	set -l selected (
	FZF_DEFAULT_COMMAND="$RG_PREFIX ''" fzf --style full --bind "change:reload:$RG_PREFIX {q} || true" --delimiter ':' --preview 'bat --style numbers --color always {1} --highlight-line {2} 2>/dev/null || cat {1}' --preview-window '+{2}+3/3,~9'
	)

	if test -n "$selected"
		set -l file (echo $selected | cut -d: -f1)
		set -l line (echo $selected | cut -d: -f2)

		if test -z "$current_command"
			commandline -r "$file"
		else
			commandline -r ""

			if string match -q -r '^(nvim|vim|vi|nano|emacs)' "$current_command"
				eval "$current_command +$line $file"
			else
				eval "$current_command $file"
			end
		end
	else
		commandline -r "$current_command"
	end

	commandline -f repaint
end
