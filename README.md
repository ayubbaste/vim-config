# vim-config
VIM configuration file

```
sudo apt-get remove vim-tiny
sudo apt-get update
sudo apt install vim-gtk
sudo apt-get install vim
```

Remove ```vim-tiny``` if installed.

```vim-gtk``` is for Debian OS.

Install Plugin Manager
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Create configuration file
```
vim ~/.vimrc
```

Read changes in config file by typing comand in vim
```
:source ~/.vimrc
```

Install plugin
```
:PluginInstall
```
