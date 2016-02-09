#! /bin/bash
set -e
# set -x

# Make debconf use a frontend that expects no interactive input at all, 
# preventing it from even trying to access stdin.
export DEBIAN_FRONTEND=noninteractive

apt-get -qq --yes update

apt-get -qq --yes upgrade

# Some standard tools
apt-get install -qq --yes language-pack-nb vim

cd /root

echo $HOSTNAME

# to avoid unnessesary traffic
#if [ -d "/vagrant/repo" ]; then
#  cp -R /vagrant/repo .
#else
#  git clone https://github.com/user/repo.git
#fi

