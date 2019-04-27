# Nico's dotfiles
This is a collection of my dotfiles. They include configuration files for:
- [git](https://git-scm.com)
- [fish](https://fishshell.com) ( ... and bash that only calls fish ... )
- [vim](https://www.vim.org) and [neovim](https://neovim.io)
- environment variables

Vim has a minimal configuration without plugins, whereas neovim is my main
editor with all plugins enabled. Configuration options that are not related to
any plugins are shared between vim and neovim.


## Dependencies
- [git](https://git-scm.com) (for vim-plug in neovim)
- [python 3](https://www.python.org) (for running the setup script)
- [fzf](https://github.com/junegunn/fzf) and
  [ripgrep](https://github.com/BurntSushi/ripgrep) (for fzf in neovim and fish)
- [nodejs](https://nodejs.org/) and [yarn](https://yarnpkg.com) (for coc in
  neovim)


## Installation
1. Clone the repository:  
`git clone https://github.com/nicolasgross/dotfiles`

2. Run the setup script:  
`python3 /path/to/cloned/repo/setup.py`

3. Install the neovim plugins. Type inside neovim:  
`:PlugInstall`

4. Optional: Backup your old configuration files, which were copied to
`REPO_ROOT/backup/` by the setup script.


## License
Unless otherwise stated at the top of a file, the contents of this repository
are released under the terms of the MIT license.

