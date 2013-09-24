#setopt XTRACE VERBOSE

if [ "$SSH_AGENT_PID" = "" ]
then
  ssh-agent | source /dev/stdin
fi

source ~/.zsh/oh-my-zsh.sh

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
setopt appendhistory autocd extendedglob hist_ignore_space hist_ignore_dups
bindkey -e
# End of lines configured by zsh-newuser-install

export LANG=en_US.UTF8
export LANGUAGE=en_US:en
export LC_NUMERIC=fr_FR.UTF-8
export LC_TIME=fr_FR.UTF-8
export LC_MONETARY=fr_FR.UTF-8
export LC_PAPER=fr_FR.UTF-8
export LC_IDENTIFICATION=fr_FR.UTF-8
export LC_NAME=fr_FR.UTF-8
export LC_ADDRESS=fr_FR.UTF-8
export LC_TELEPHONE=fr_FR.UTF-8
export LC_MEASUREMENT=fr_FR.UTF-8
export LC_CTYPE=en_US.UTF-8

export PATH=$PATH:/sbin:/usr/local/heroku/bin

#source ~/.zsh/git-prompt/zshrc.sh
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%b '
zstyle ':vcs_info:*' unstagedstr "↑"
zstyle ':vcs_info:*' stagedstr "↓"
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:git*+set-message:*' hooks git_added git_modified git_deleted git_untracked

+vi-git_added() {
  NUM_ADD=`git status --porcelain |grep '^ A '|wc -l`
  if [[ "$NUM_ADD" == "0" ]]; then
    NUM_ADD='_'
  fi
}

+vi-git_modified() {
  NUM_MOD=`git status --porcelain |grep '^ M '|wc -l`
  if [[ "$NUM_MOD" == "0" ]]; then
    NUM_MOD='_'
  fi
}

+vi-git_deleted() {
  NUM_DEL=`git status --porcelain |grep '^ D '|wc -l`
  if [[ "$NUM_DEL" == "0" ]]; then
    NUM_DEL='_'
  fi
}

+vi-git_untracked() {
  NUM_UNT=`git status --porcelain |grep '^?? '|wc -l`
  if [[ "$NUM_UNT" == "0" ]]; then
    NUM_UNT='_'
  fi
}

precmd() {
  vcs_info
  if [[ -n $vcs_info_msg_0_ ]] ; then
#    RPROMPT=$'[$fg_bold[green]$NUM_ADD$fg_bold[magenta]$NUM_MOD$fg_bold[red]$NUM_DEL$fg_bold[cyan]$NUM_UNT$fg_no_bold[default]]'
    RPROMPT=$'[%{$fg_bold[green]%}$NUM_ADD%{$fg_bold[magenta]%}$NUM_MOD%{$fg_bold[red]%}$NUM_DEL%{$fg_bold[cyan]%}$NUM_UNT%{$fg_no_bold[default]%}] ${vcs_info_msg_0_}'
  else
    RPROMPT=$'[%{$fg_bold[blue]%}%n%{$fg_no_bold[default]%} @ %U%m%u]'
  fi
}

#PROMPT='%B%n@%m %1~%b$(git_super_status) %# '
PROMPT=$'%{$fg_no_bold[green]%}%80<...<%~%{$fg_no_bold[default]%}%(?..%{$fg_bold[red]%} !%?%{$fg_no_bold[default]%}) # '

source ~/.zsh/aliases.sh
source ~/.zsh/exports.sh
source ~/.zsh/ssh_keys.sh

source ~/.zsh/aws/setup
source ~/.zsh/nodejs.sh

export PATH=$PATH:~/tools/scripts

export _JAVA_AWT_WM_NONREPARENTING=1
