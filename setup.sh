
# ---------------------------------------------------------------------
# (Neo)vim
# ---------------------------------------------------------------------

# Install ripgrep for CtrlP
# Install nvim
if [ "$(uname)" == "Darwin" ]; then
    brew install ripgrep
    brew install neovim
else
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install ripgrep
    sudo apt-get install neovim
fi

# download plugin manager for vim
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# download plugin manager for nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#cp vim/vimrc ~/.vimrc

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
# if [ "$(uname)" == "Darwin" ]; then
#     brew install tmux
#     brew install reattach-to-user-namespace
#     cp tmux/tmux-macos.conf ~/.tmux.conf
# else
#     sudo apt-get install tmux
#     sudo apt-get install xsel
#     cp tmux/tmux-linux.conf ~/.tmux.conf
# fi
# 
# # download plugin manager for tmux
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# 
# ~/.tmux/plugins/tpm/scripts/install_plugins.sh
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
echo "{" >> config.json
cat docker.config >> config.json
tail -n +2 ~/.docker/config.json >> config.json
cp config.json ~/.docker/config.json
rm config.json
