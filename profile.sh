
echo "*** environment loaded from ${BASH_SOURCE[0]} via ${BASH_SOURCE[1]}"

export PS1='[\u@\h \W]\$ '

alias tg="terragrunt"
alias tgi="terragrunt init"
alias tga="terragrunt apply"
alias tgp="terragrunt plan"
alias tf="terraform"
alias tfm="terraform fmt"
alias rm="rm -rf"
alias vi="vim"
alias ll="ls -lah"
alias gs="git status"
alias te11="tfenv use 0.11.15 && tgswitch 0.18.7"
alias te12="tfenv use 0.12.31 && tgswitch 0.24.4"
alias te1="tfenv use 1.0.11 && tgswitch 0.35.10"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

#pyenv install 3.9.10

#pyenv global 3.9.10

export PATH="$HOME/.tfenv/bin:$PATH"

eval "$(direnv hook bash)"