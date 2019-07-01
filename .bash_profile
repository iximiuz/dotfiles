# -== Common ==-
export HISTSIZE=''
export HISTFILESIZE=''
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"

# -== aliases ==-
# bash
alias mc='LANG=en_EN.UTF-8 mc'
alias ll='ls -lahG'
alias duh="du -h"
alias duh1="du -d 1 -h"

# iterm2
alias iterm2_tab_color_red='echo -e "\033]6;1;bg;red;brightness;255\a"'
alias iterm2_tab_color_green='echo -e "\033]6;1;bg;green;brightness;255\a"'
alias iterm2_tab_color_default='echo -e "\033]6;1;bg;*;default\a"'

# node
alias nrc="npm run compile"
alias nrd="npm run compile"
alias nrt="npm run test"
alias nrtu="npm run test-unit"
alias nrtc="npm run test-component"
alias nrti="npm run test-integration"
# -== eof: aliases ==-


# -== Git ==-
# show git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w - \$(parse_git_branch)\[\033[00m\] $ "

# copy Git current branch to clipboard
alias gcb="git branch | grep \* | cut -c 3- | tr -d '\n' | pbcopy"
# -== eof: Git ==-


# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Go
PATH="$HOME/go/bin:${PATH}"
export PATH

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

