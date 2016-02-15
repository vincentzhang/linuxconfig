# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# ctrlp
cd ~/.vim
git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
# :helptags ~/.vim/bundle/ctrlp.vim/doc
# sensible
git clone git://github.com/tpope/vim-sensible.git
# powerline
pip install powerline-status
mkdir ~/repo && cd ~/repo
git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh
