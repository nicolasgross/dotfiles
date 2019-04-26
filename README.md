# Nico's dotfiles
This is a collection of my dotfiles.

Vim has a minimal configuration without plugins whereas neovim is my main
editor with all plugins enabled. Configuration options that are not related to
any plugins are shared between vim and neovim.


## Dependencies
- git
- ripgrep for fzf
- nodejs, yarn for coc


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

