## VIM config

```
# update vim and activate conceal with
brew install vim

# install nerd-fonts with fira code and replace font in terminal with pt12
# its to have icons and fira code
brew tap homebrew/cask-fonts
brew cask install font-fira-code-nerd-fontbrew

# install to work plugin ctags
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

Order packages


## ZSH config

```
# install rg ripgrep for search into files
# install fzf for search by filename and more similar functionalities
# install bat for have colors in cat
brew install bat fzf ripgrep
brew install eth-p/software/bat-extras            # install to have bat-extras

# install pxl to view images in terminal
go get github.com/ichinaski/pxl

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# theme is seted in .zshrc

# install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# plugin is activated in .zshrc

$(brew --prefix)/opt/fzf/install   # to activate fzf key bindings functionality
```

Link zsh
`ln -sv ~/.dotfiles/.zshrc ~`


