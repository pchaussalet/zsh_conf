
ssh-add -l |grep 'd8:07:72:5c:50:44:f7:d4:7c:a2:0f:37:59:36:0a:ee' >/dev/null
if [[ $? != 0 && -f .ssh/pchaussalet.pem ]]; then
  ssh-add .ssh/pchaussalet.pem
fi

