# Setting up vim

## Install

```sh
git clone git@github.com:Enome/vim.git
git submodule init
git submodule update
```

## Packages

source: https://shapeshed.com/vim-packages/

### Add Packages

```sh
cd ~/.vim
git submodule init
git submodule add https://github.com/vim-airline/vim-airline.git pack/others/start/vim-airline
git add .gitmodules pack/others/start/vim-airline
git commit
```

### Update Packages

```sh
git submodule update --remote --merge
git commit
```

### Remove Packages

```sh
git submodule deinit pack/others/start/vim-airline
git rm pack/others/start/vim-airline
rm -Rf .git/modules/pack/shapeshed/start/vim-airline
git commit
```
