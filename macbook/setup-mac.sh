#!/bin/bash

setup_pkg()
{
    if [[ ! $(which brew) ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    brew update

    PACKAGES=(
        bat
        htop
        git
        gdb # GNU debugger
        neovim
        nyancat
        pyenv
        pyenv-virtualenv
        # rbenv # ruby 설치법도 찾아봐야함
        stow # Organize software neatly under a single directory tree (e.g. /usr/local)
        tmux
        tree # Display directories as trees (with optional color/HTML output)
        vim
        wget # Internet file retriever
        # yarn --ignore-dependencies # 옵션 주는게 가능한지 확인해봐야함
        zsh
        zsh-completions # Additional completion definitions for zsh ??
    )

    echo "Installing packages..."
    brew install ${PACKAGES[@]}

    # applicaion list
    # https://formulae.brew.sh/cask/
    APPLICATIONS=(
        alfred
        alt-tab
        firefox
        google-chrome
        iterm2
        itsycal
        karabiner-elements
        notion
        postman
        slack
        springtoolsuite
        telegram
        visual-studio-code
    )

    echo "Installing applications..."
    brew install --cask ${APPLICATIONS[@]}
}

setup_font()
{
    # brew taps
    brew tap homebrew/cask-fonts # only need to do this once

    FONTS=(
        font-inconsolata
        font-roboto-mono
        font-hack-nerd-font
        font-meslo-lg-nerd-font
    )

    echo "Installing fonts..."
    brew install --cask ${FONTS[@]}
}

setup_osx_system()
{
    echo "Configuring OSX..."
    # Show filename extensions by default
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Enable tap-to-click
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    # Make dock faster
    defaults write com.apple.dock autohide -bool true;killall Dock
    defaults write com.apple.dock autohide-delay -float 0;killall Dock
    defaults write com.apple.dock autohide-time-modifier -float 0;killall Dock

    # Make launchpad faster
    defaults write com.apple.dock springboard-show-duration -int 0;killall Dock
    defaults write com.apple.dock springboard-hide-duration -int 0;killall Dock

    # Make Mission Control faster
    defaults write com.apple.dock expose-animation-duration -float 0;killall Dock

    # Make Save Dialog faster
    defaults write -g NSWindowResizeTime -float 0.01

    # Make popup faster
    defaults write -g NSAutomaticWindowAnimationsEnabled -bool FALSE

    # See all files
    defaults write com.apple.Finder AppleShowAllFiles YES
}

setup_dir()
{
    echo "Creating directory..."
    [[ ! -d workspace ]] && mkdir workspace
}

setup_tmux()
{
    echo "Setting tmux..."
    # tmux
    cp ./bin/tat /usr/local/bin
    stow dotfiles/tmux
}

setup_zsh()
{
    echo "Setting zsh..."
    # zsh
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    npm install --global pure-prompt
}

setup_iterm()
{
    echo "Downloading iterm theme..."
    # iterm theme
    #wget https://raw.githubusercontent.com/JonathanSpeek/palenight-iterm2/master/palenight.itermcolors
}

setup_pkg
setup_osx_system
#setup_dir
#setup_tmux
#setup_zsh
#setup_iterm

