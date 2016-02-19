#! /bin/bash
set -e
set -x

# Make debconf use a frontend that expects no interactive input at all, 
# preventing it from even trying to access stdin.
export DEBIAN_FRONTEND=noninteractive

apt-get -qq --yes update

apt-get -qq --yes upgrade

# Some standard tools
apt-get install -qq --yes language-pack-nb vim

#sed -i 's/^#ListenAddress 0.0.0.0$/ListenAddress 0.0.0.0/' /etc/ssh/sshd_config

# Configure network
cp /vagrant/data/visitor-eth1.cfg /etc/network/interfaces.d/

# This is apparently not included in 14.04
#echo 'source /etc/network/interfaces.d/*.cfg' >> /etc/network/interfaces

ifup eth1

# to avoid unnessesary traffic
#if [ -d "/vagrant/repo" ]; then
#  cp -R /vagrant/repo .
#else
#  git clone https://github.com/user/repo.git
#fi

