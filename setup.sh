
# ---------------------------------------------------------------------
# (Neo)vim
# ---------------------------------------------------------------------

# Install ripgrep for CtrlP
# Install nvim
if [ "$(uname)" == "Darwin" ]; then
    brew install ripgrep
    brew install neovim
else
    sudo apt-get -y install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get -y install ripgrep
    sudo snap install ripgrep --classic
    sudo apt-get -y install neovim
    sudo apt-get -y install python3-pip
    sudo apt-get -y install curl

    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
    sudo dpkg -i ripgrep_12.1.1_amd64.deb
fi

# download plugin manager for vim
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# download plugin manager for nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#cp vim/vimrc ~/.vimrc

# Install Python3 interface for deoplete
pip3 install --user pynvim

mkdir -p ~/.config/nvim
cp nvim/init.vim ~/.config/nvim/init.vim


# ---------------------------------------------------------------------
# Git
# ---------------------------------------------------------------------

cp git/gitconfig ~/.gitconfig

# ---------------------------------------------------------------------
# Tmux
# ---------------------------------------------------------------------

# install tmux
if [ "$(uname)" == "Darwin" ]; then
    brew install tmux
    brew install reattach-to-user-namespace
    cp tmux/tmux-macos.conf ~/.tmux.conf
else
    sudo apt-get -y install tmux
    sudo apt-get -y install xsel
    cp tmux/tmux-linux.conf ~/.tmux.conf
fi

# download plugin manager for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

~/.tmux/plugins/tpm/scripts/install_plugins.sh
# 
# # ---------------------------------------------------------------------
# # Tex
# # ---------------------------------------------------------------------
# 
# cp tex/latexmkrc ~/.latexmkrc

# ---------------------------------------------------------------------
# Bash
# ---------------------------------------------------------------------

cat bash/bashrc >> ~/.bashrc
cat bash/bash_profile >> ~/.bash_profile
cat bash/inputrc >> ~/.inputrc
cat bash/git-completion.bash > ~/.git-completion.bash
cat bash/connect_ec2.sh > ~/.connect_ec2.sh

 
# ---------------------------------------------------------------------
# Docker 
# ---------------------------------------------------------------------
if [ -f "~/.docker/config.json" ]; then
    echo "{" >> config.json
    cat docker.config >> config.json
    tail -n +2 ~/.docker/config.json >> config.json
    cp config.json ~/.docker/config.json
    rm config.json
else
    mkdir ~/.docker
    echo -e "{\n\t"detachKeys": "ctrl-s,s"\n}" > ~/.docker/config.json
fi
