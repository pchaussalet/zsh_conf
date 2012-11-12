
ifconfig eth0 |grep 10.0.1.124 > /dev/null
if [[ $? == 0 ]]; then
  source ~/mappyrc
else
  ssh-add -l |grep '35:ba:2e:0b:d8:60:48:2a:95:92:a2:84:ad:e8:63:f5' >/dev/null
  if [[ $? == 0 ]]; then
    source ~/mappyrc
  else
    ssh-add -l |grep '50:3d:57:ba:46:36:18:4c:fd:88:9d:de:8c:61:ea:c0' >/dev/null
    if [[ $? == 0 ]]; then
      source ~/axa-directrc
    fi
  fi
fi
ssh-add -l |grep '08:77:dc:9c:3e:1e:97:bb:c2:06:27:51:f9:2e:cc:f2' >/dev/null
if [[ $? != 0 ]]; then
  ssh-add .ssh/pchaussalet.pem
fi

