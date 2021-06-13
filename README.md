# plain-nvim

The plain NeoVim easy-to-use configuration builded with Lua. Just few plugins adding the only necessary functionality.

## Plugins

This configuration contains base plugins:
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- [nvim-bufferline](https://github.com/akinsho/nvim-bufferline.lua)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [lualine](https://github.com/hoob3rt/lualine.nvim)
- [packer](https://github.com/wbthomason/packer.nvim)

## Installing

### Dependencies
- NeoVim >v0.5.0-dev
- [Nerd Fonts](https://www.nerdfonts.com/) - for nvim-web-devicons

### Process

- [Install](https://github.com/neovim/neovim/wiki/Installing-Neovim) NeoVim
- Clone this repo
```bash
git clone https://github.com/iveahugeship/plain-nvim/
```
- Replace current NeoVim configuration by cloned configuration
```bash
rm -rf ~/.config/nvim
ln -sf ./plain-nvim ~/.config/nvim
```

### Update

Just pull:
```bash
git pull origin master
```

## Usage

### Keymap

Normal mode:
- <C-f> - toggle NvimTree
- <C-[> - previous buffer
- <C-]> - next buffer
- <C-p> - pick buffer by his letter identificator
- <C-q> - close buffer

NvimTree:
- e - cd to directory
- o - open/close directory / open file
- v - open file with vertical split
- s - open file with horizontal split
- t - open file in new tab
- <TAB> - preview file
- i - toggle ignored
- . - toggle dotfiles
- R - refresh tree
- a - create file
- d - remove file
- r - rename file
- x - cut file
- y - copy file
- p - paste file

### File Type plugins

Code style controlled by File Type plugins:
- sh
- bash
- zsh
- cfg
- json
- yaml
- toml
- dockerfile
- tf
- vim
- lua
- python
- ruby

### Packer Wrapper

Packer Wrapper locates in *lua/plugins.packer.lua*. It installes Packer if it is not installed yet.
Also it provides convenient interface for plugin and their configuration managing. Interface uses plugin-as-a-file way.
To adding new plugin create file with plugin meta data and configuration. For example:
```bash
lua/plugin/some-plugin.lua

local function config()
    -- Some configuration here.
end

local meta = {
    -- Native Packer plugin meta.
    "repo/some-plugin.lua",
    config = config(),
    requires = require("plugins.nvim-web-devicons")
}

return meta
```

For describing the plugin *meta* use [this](https://github.com/wbthomason/packer.nvim#specifying-plugins) information. One feature
is *requires* key. Since the plugin describes as a file you can pass another plugin by *require* lua keyword. Passed plugin will be
installed as dependency.

Another feature is *config* key. You should specify created *config* function here and is will be executed after the plugin loading.

After the creating plugin add it to *lua/plugin/init.lua*. For correct plugin loading you should use wrapped packer *use* function:
```bash
lua/plugin/init.lua

-- Neovim Plugins.

local use = require("plugins.packer").use

use(require("plugins.some-plugin"))
```

### Configuration Structure

```bash
├── ftplugin                          - file type plugins
├── init.lua                          - initial core lua modules (ftplugin, lua)
└── lua                               - nvim lua-based configuration
    ├── plugins                       - plugins
    │   ├── init.lua                  - initial plugin modules
    │   └── packer.lua                - packer wrapper
    └── settings                      - nvim configuration
        ├── defaults.lua              - default settings
        ├── init.lua                  - initial settings module configuration
        └── keymapping.lua            - key mapping
```
