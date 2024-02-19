# Config

## install dotfiles

will also install .ssh keys
```bash
ansible-playbook --ask-become-pass --ask-vault-pass main.yml
stow --target ~ --dir . --stow dotfiles
```


# ensure_installed
(Not working - issue with brew)
the `ensure_installed` should contain the packages to be installed.


# Post install scripts/commands
```bash
# lazy load nvm
git clone https://github.com/lukechilds/zsh-nvm $ZSH/custom/plugins/zsh-nvm
# zsh auto suggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# syntax highlighting brew(MacOs)
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
# syntax Highlighting linux
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


#replaces cd with z
z --cmd cd
# Set the default nvim configuration
ln -s nvim-lazyvim nvim
```
