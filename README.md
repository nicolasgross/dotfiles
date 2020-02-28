# Nico's dotfiles
This is a collection of my dotfiles. They include configuration files for:
- git
- [fish](https://fishshell.com)
- bash
- [vim](https://www.vim.org) and [neovim](https://neovim.io)
- environment variables

My (neo)vim configuration is heavily inspired by
[spacemacs](http://spacemacs.org) and uses 'Space' as the leader key. Vim is
configured to run without any plugins installed, whereas neovim is configured
to use some plugins. Configuration options that are not related to any plugins
are shared between vim and neovim.


## Dependencies
- [python 3](https://www.python.org) +
  [dotbot](https://github.com/anishathalye/dotbot) (to bootstrap the dotfiles)
- [git](https://git-scm.com) (for vim-plug in neovim)
- [nodejs](https://nodejs.org/) and [yarn](https://yarnpkg.com) (for coc in
  neovim)
- [fzf](https://github.com/junegunn/fzf) and
  [ripgrep](https://github.com/BurntSushi/ripgrep) (for fzf in neovim and fish)


## Installation
1. Install dotbot:  
`pip install --user dotbot`

2. Clone the repository:  
`git clone https://github.com/nicolasgross/dotfiles`

3. Copy `gitcredentials-template` to `gitcredentials` and fill in your data.

4. Run dotbot:  
`dotbot -c REPO_ROOT/install.conf.yaml`  

5. Install the neovim plugins. Type inside neovim:  
`:PlugInstall`


## License
Unless otherwise stated at the top of a file, the contents of this repository
are released under the terms of the MIT license.

