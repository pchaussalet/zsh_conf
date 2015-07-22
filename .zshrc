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
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_PAPER=en_US.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=en_US.UTF-8
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
  if [[ -z $OVERRIDE_PROMPT ]]; then
    vcs_info
    if [[ -n $vcs_info_msg_0_ ]] ; then
  #    RPROMPT=$'[$fg_bold[green]$NUM_ADD$fg_bold[magenta]$NUM_MOD$fg_bold[red]$NUM_DEL$fg_bold[cyan]$NUM_UNT$fg_no_bold[default]]'
      RPROMPT=$'[%{$fg_bold[green]%}$NUM_ADD%{$fg_bold[magenta]%}$NUM_MOD%{$fg_bold[red]%}$NUM_DEL%{$fg_bold[cyan]%}$NUM_UNT%{$fg_no_bold[default]%}] ${vcs_info_msg_0_}'
    else
      RPROMPT=$'[%{$fg_bold[blue]%}%n%{$fg_no_bold[default]%} @ %U%m%u]'
    fi
    if [ "_$DOCKER_MACHINE_NAME" = "_" ]; then
      #PROMPT='%B%n@%m %1~%b$(git_super_status) %# '
      PROMPT=$'%{$fg_no_bold[green]%}%80<...<%~%{$fg_no_bold[default]%}%(?..%{$fg_bold[red]%} !%?%{$fg_no_bold[default]%}) # '
    else
      PROMPT="($DOCKER_MACHINE_NAME)"$'%{$fg_no_bold[green]%}%80<...<%~%{$fg_no_bold[default]%}%(?..%{$fg_bold[red]%} !%?%{$fg_no_bold[default]%}) # '
    fi
  fi
}


source ~/.zsh/aliases.sh
source ~/.zsh/exports.sh
source ~/.zsh/ssh_keys.sh

source ~/.zsh/ruby.sh
source ~/.zsh/play.sh
source ~/.zsh/node.sh
source ~/.zsh/sublime_text.sh
source ~/.zsh/webstorm.sh
source ~/.zsh/idea.sh
source ~/.zsh/montagestudio.sh

switch_display() {
  local ext_display=$1
  local mode=$2
  local scale=$3
  if [[ ${mode} == off ]] ; then
    CMD="/usr/bin/xrandr --output eDP1 --auto --output ${ext_display} --off"
  else
    if [[ -n ${scale} ]] ; then
      CMD="/usr/bin/xrandr --output eDP1 --auto --output ${ext_display} --auto --${mode} eDP1 --scale ${scale}"
    else
      CMD="/usr/bin/xrandr --output eDP1 --auto --output ${ext_display} --auto  --${mode} eDP1"
    fi
  fi
  echo $CMD
  /bin/sh -c $CMD
}

export PATH=$PATH:~/scripts:~/tools

export _JAVA_AWT_WM_NONREPARENTING=1

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source ~/.zsh/golang
