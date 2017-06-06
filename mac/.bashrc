alias ll='ls -l'
. ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

# Bash profile setup, http://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added for Homebrew, bring user-specific apps ahead of system-wide apps
export PATH=/usr/local/bin:$PATH

# bash auto completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=false
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Virturalenv/ VirtualenvWrapper
source /usr/local/bin/virtualenvwrapper.sh
export PROJECT_HOME=~/gitrepo
alias cmput="cd /Users/vzhang/Documents/UofA/courses/CMPUT229/winter16"


. /Users/vzhang/gitrepo/torch/install/bin/torch-activate

function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/bin/python "$@"
    else
        /usr/bin/python "$@"
    fi
}
alias rl="cd /Users/vzhang/Documents/UofA/courses/CMPUT609RL"
alias sssh="ssh -t zichen2@innisfree.cs.ualberta.ca 'ssh vzhang@localhost -p 10022'"

# added by travis gem
[ -f /Users/vzhang/.travis/travis.sh ] && source /Users/vzhang/.travis/travis.sh
