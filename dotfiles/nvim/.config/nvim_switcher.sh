vv() {
	# Check if ~/.config/nvim is a directory and not a symlink
	if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
		echo "There is an existing 'unnamed' nvim config directory."

		# Prompt user for action
		read "rename?Do you want to rename the existing config? [y/N]: "
		if [[ "$rename" =~ ^[Yy]$ ]]; then
			local new_name=""
			while [[ ! "$new_name" =~ ^nvim-.+ ]]; do
				read "new_name?Enter new name (nvim-<something>): "
				if [[ -z "$new_name" ]]; then
					echo "No name entered. Aborting."
					return
				fi
			done

			# Rename the existing directory
			mv ~/.config/nvim ~/.config/"$new_name"
			echo "Renamed existing config to $new_name."
		else
			echo "Operation aborted."
			return
		fi
	fi

	# Proceed with the existing logic to select a config with fzf
	local config=$(fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=50% --layout=reverse --border --exit-0)

	# If I exit fzf without selecting a config, don't open Neovim
	[[ -z $config ]] && echo "No config selected" && return

	# Update the ~/.config/nvim symlink to point to the selected config
	ln -sfn "$config" ~/.config/nvim

	echo "Neovim config switched to $(basename $config)"

	# Open Neovim in the current directory if no arguments are supplied, or with the supplied arguments
	if [ $# -eq 0 ]; then
		NVIM_APPNAME=$(basename $config) nvim .
	else
		NVIM_APPNAME=$(basename $config) nvim "$@"
	fi
}
