#!/usr/bin/env python3

# Setup all the dotfiles by symlinking from the cloned repo to the config
# location.

import os, inspect, getpass, sys, shutil, pathlib
# from pathlib import Path

## The list of files/dirs which should be linked to ~/.config
configs = ['compton', 'dunst', 'fish', 'i3', 'i3blocks', 'nvim/init.vim']
user = getpass.getuser()

## Change to the dotfiles directory
filename = inspect.getframeinfo(inspect.currentframe()).filename
dotfilesPath = os.path.dirname(os.path.abspath(filename))
os.chdir(dotfilesPath)

## Check wether backup folder already exists
backupPath = pathlib.Path(dotfilesPath + "/backup")
if not backupPath.is_dir():
    os.makedirs(str(backupPath))
else:
    print("Backup folder (" + str(backupPath) + ") already exists.")
    sys.exit(1)

## Function to check for existing configs and to backup them
def configBackup(path, configName):
    if (path.exists()):
        backup = str(backupPath) + '/' + configName
        head, tail = os.path.split(configName)
        if not head == '':
            os.makedirs(str(backupPath) + '/' + head)
        shutil.move(str(path), backup)
        print("Previous " + configName + " config saved in " + dotfilesPath + \
                "/backup")

## Check for already existing config files and backup them
for i in configs:
    file = pathlib.Path('/home/' + user + '/.config/' + i)
    configBackup(file, i)
### Special cases:
#### vim
file = pathlib.Path('/home/' + user + '/.vimrc')
configBackup(file, '.vimrc')

## Create symlinks from dotfiles repo to config locations
for i in configs:
    source = dotfilesPath + '/' + i
    destination = '/home/' + user + '/.config/' + i
    os.symlink(source, destination)
### Special cases:
#### vim
source = dotfilesPath + '/nvim/init.vim'
destination = '/home/' + user + '/.vimrc'
os.symlink(source, destination)

