# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/pchaussalet/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

LANG=en_US.UTF8
LANGUAGE=en_US:en
LC_NUMERIC=fr_FR.UTF-8
LC_TIME=fr_FR.UTF-8
LC_MONETARY=fr_FR.UTF-8
LC_PAPER=fr_FR.UTF-8
LC_IDENTIFICATION=fr_FR.UTF-8
LC_NAME=fr_FR.UTF-8
LC_ADDRESS=fr_FR.UTF-8
LC_TELEPHONE=fr_FR.UTF-8
LC_MEASUREMENT=fr_FR.UTF-8
export LC_CTYPE=en_US.UTF-8

source ~/.zsh/git-prompt/zshrc.sh
PROMPT='%B%n@%m %1~%b$(git_super_status) %# '

source ~/.zsh/aliases.sh
source ~/.zsh/exports.sh
source ~/.zsh/ssh_keys.sh

