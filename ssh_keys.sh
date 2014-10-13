
if [[ $HOST == 'pchaussalet-xps13' ]]
then
  ssh-add -l |grep '75:4a:d8:a6:08:39:e3:5b:24:79:e8:3c:9a:c9:c3:5e' >/dev/null
  if [[ $? != 0 && -f .ssh/pchaussalet.pem ]]; then
    ssh-add .ssh/pchaussalet.pem
  fi
fi

