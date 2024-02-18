# AstroNvim User Configuration Example

A user configuration template for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

Also hosts the .tmux.conf file:

```bash
# Make sure to symlink this config file into ~/.tmux.conf
lk -s ~/.config/nvim/lua/user/tmux.conf ~/.tmux.conf
# install the plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
<C-a I> to install plugins
<C-a R> to refresh
```

# Quick install

```bash

git clone https://github.com/SirAppSec/astronvim_config ~/.config/nvim/lua/user
nvim --headless -c 'quitall'
git remote set-url origin https://{token}@github.com/sirappsec/astronvim_config
```

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```
