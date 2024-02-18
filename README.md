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
#replaces cd with z
z --cmd cd
```
