docker network create keycloak-network
snetz=`docker network inspect keycloak-network | grep "Subnet"  | sed s/" "/""/g | sed s/"\,"/""/g | sed s/":"/"\n"/g  | grep -v "Subnet" | sed s/'"'/''/g`
nid=`docker network ls | grep keycloak-network | awk '{print $1}'`

ufw allow in on br-$nid
ufw route allow in on br-$nid
ufw route allow out on br-$nid
iptables -t nat -A POSTROUTING ! -o br-$nid -s $snetz -j MASQUERADE

# # For removing firewall settings we don't want:
# ufw status numbered
# ufw delete [NUMBER]
