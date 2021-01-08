# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/paul/.zshrc'

fpath+=$HOME/.zsh
fpath+=$HOME/.zsh/pure

autoload -Uz compinit
compinit

autoload -U promptinit; promptinit
prompt pureone

export VISUAL=nvim
export EDITOR=nvim


alias ls='ls --color=auto'
alias l='ls -lhrt'
alias la='ls -lah'
alias ll='exa -lah --git'

alias tarx='tar -xvzf'

alias venv='source venv/bin/activate'

alias preparejs='source ~/.dotfiles/js/prepare.sh'
alias vim='nvim'
alias vi='nvim'

alias co='xclip'
alias pa='xclip -o'

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#GUROBI
export GUROBI_HOME="/opt/gurobi910/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"

#RUST
export PATH=/home/paul/.cargo/bin:$PATH
export PATH=/home/paul/.local/bin:$PATH

#NODE
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
