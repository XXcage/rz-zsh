#!/bin/bash

release_file=/etc/os-release

if grep -q "Debian" $release_file || grep -q "Ubuntu" $release_file
then

    # Update package information
    sudo apt update

    # Install Zsh
    sudo apt install -y zsh

    # Install fzf
    sudo apt install -y fzf

    # Clone Oh My Zsh
    git clone https://github.com/XXcage/ohmyzsh.git ~/.oh-my-zsh

    # Download .zshrc
    curl -sLJO https://raw.githubusercontent.com/XXcage/rz-zsh/main/rz-rcfile && mv rz-rcfile ~/.zshrc

    # Clone zsh-syntax-highlighting plugin
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

    # Clone zsh-autosuggestions plugin
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions

    # Set Zsh as the default shell
    sudo chsh -s /usr/bin/zsh $USER

    # Print completion message
    echo "Zsh installation complete. Please restart your terminal."
fi
