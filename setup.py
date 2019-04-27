#!/usr/bin/env python3

# Setup all the dotfiles by linking from the cloned repo to the config
# location.

import os
import inspect
import getpass
import sys
import shutil
import pathlib
import requests

# The list of files/dirs which should be linked to ~
home = ['.gitconfig', '.profile', '.bashrc']
# The list of files/dirs which should be linked to ~/.config
dotConfig = ['fish', 'nvim']
user = getpass.getuser()

# Build path of the cloned dotfiles repository
filename = inspect.getframeinfo(inspect.currentframe()).filename
dotfilesPath = os.path.dirname(os.path.abspath(filename))

# Check whether backup folder already exists
backupPath = pathlib.Path(dotfilesPath + "/backup")
if not backupPath.is_dir():
    os.makedirs(str(backupPath))
else:
    print("Backup folder (" + str(backupPath) + ") already exists.")
    sys.exit(1)


# CREATE BACKUP

# Function to check for existing configs and to backup them
def configBackup(path, configName):
    if (path.exists() or os.path.islink(str(path))):
        backup = str(backupPath) + '/' + configName
        head, tail = os.path.split(configName)
        backupSubFolder = str(backupPath) + '/' + head
        if (not head == '' and not pathlib.Path(backupSubFolder).exists()):
            os.makedirs(backupSubFolder)
        shutil.move(str(path), backup)
        print("Previous " + configName + " config saved in " + dotfilesPath +
              "/backup")


# Check for already existing config files in ~/ and backup them
for i in home:
    file = pathlib.Path('/home/' + user + '/' + i)
    configBackup(file, i)

# Check for already existing config files in ~/.config/ and backup them
for i in dotConfig:
    file = pathlib.Path('/home/' + user + '/.config/' + i)
    configBackup(file, i)

# Special backup cases:
# vim (uses neovim config)
file = pathlib.Path('/home/' + user + '/.vimrc')
configBackup(file, '.vimrc')


# CREATE SYMLINKS

def createSymlink(source, destination):
    head, tail = os.path.split(destination)
    if (not pathlib.Path(head).exists()):
        os.makedirs(head)
    os.symlink(source, destination)


# Create symlinks from dotfiles repo to ~/
for i in home:
    source = dotfilesPath + '/' + i
    destination = '/home/' + user + '/' + i
    createSymlink(source, destination)

# Create symlinks from dotfiles repo to ~/.config/
for i in dotConfig:
    source = dotfilesPath + '/' + i
    destination = '/home/' + user + '/.config/' + i
    createSymlink(source, destination)

# Special linking cases:
# vim (uses neovim config)
source = dotfilesPath + '/nvim/init.vim'
destination = '/home/' + user + '/.vimrc'
createSymlink(source, destination)


# Install vim-plug
response = requests.get('https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
f = open('/home/' + user + '/.local/share/nvim/site/autoload/plug.vim', "w")
f.write(response.text)
f.close()


print("Config files successfully installed!")

