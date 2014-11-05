#! /bin/bash
set -e
set -x

VMXNET=$(cat /proc/modules | grep -q vmxnet; echo $?)
if [ $VMXNET -eq 0 ]; then
  echo "On virtual machine, setting up apt proxy"
  GATEWAY=$(ip route show | grep ^default | cut -d' ' -f 3)
  HOST="$(echo -n $GATEWAY | cut -d . -f 1-3).$(($(echo $GATEWAY | cut -d . -f 4 )-1))"
  echo "Acquire::http { Proxy \"http://$HOST:3142\"; };" >> /etc/apt/apt.conf.d/01proxy
fi

# Some standard tools
apt-get install --yes language-pack-nb vim htop most git

cd /root

# to avoid unnessesary traffic
#if [ -d "/vagrant/repo" ]; then
#  cp -R /vagrant/repo .
#else
#  git clone https://github.com/user/repo.git
#fi

