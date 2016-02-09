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

# Set up iptables before we install iptables-persistent
iptables --table nat    --add POSTROUTING --out-interface eth0 --jump MASQUERADE
iptables --table filter --add FORWARD --protocol tcp --match multiport --dports 22,53,80,443,8080,8443 --jump ACCEPT
iptables --table filter --add FORWARD --protocol udp --match multiport --dports 53                     --jump ACCEPT
iptables --table filter --add FORWARD --protocol tcp --match multiport --sports 22,53,80,443,8080,8443 --jump ACCEPT
iptables --table filter --add FORWARD --protocol udp --match multiport --sports 53                     --jump ACCEPT
iptables --table filter --policy-P FORWARD DROP

apt-get install --yes iptables-persistent

# It's a gateway, we want ip forward
sysctl -w net.ipv4.ip_forward=1

