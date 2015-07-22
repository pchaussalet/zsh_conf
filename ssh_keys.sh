
if [[ $HOST == 'pchaussalet-m3800' ]]
then
  ssh-add -l |grep 'cf:e3:17:96:3f:db:58:98:cf:d6:93:a5:15:37:d7:bf' >/dev/null
  if [[ $? != 0 && -f .ssh/pchaussalet-m3800.pem ]]; then
    ssh-add .ssh/pchaussalet-m3800.pem
  fi
fi

