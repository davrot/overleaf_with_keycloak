# Some installation notes

1. Clone the repo via git clone https://github.com/davrot/overleaf_with_keycloak.git
2. Go into the directories keycloakpostgres  keycloakserver  nginx  overleafmongo  overleafredis  overleafregister  overleafserver. There modify the .env and the compose.yaml according to your setup.
3. Put your SSL certificates into nginx as ca.pem (public certificate plus certificate chain) and key.pem (private key).
4. Make you system docker ready and make the system ready to send emails (example below)
5. Go to overleafregister and run make_image.sh
6. In overleafregister do up.sh (later overleafregister/data/config.json needs to be filled with the correct parameters but for that you need a running keycloack)
7. In overleafredis do up.sh
8. In overleafmongo do up.sh
9. In keycloakpostgres do up.sh
10. In keycloakserver do up.sh
11. In overleafserver do up.sh
12. In nginx do up.sh
13. In check_users do up.sh
14. Now we can go into the keycloack server to get the client id and secrets (see how_to_keycloak_A).
    
[... To be continued]

# Docker and eMail (Ubuntu)

```
apt update
apt upgrade

apt install git pkg-config libssl-dev curl mc argon2 ca-certificates net-tools

install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  apt-get update
  
  apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "{" > /etc/docker/daemon.json
echo '  "iptables": false' >> /etc/docker/daemon.json 
echo "}" >> /etc/docker/daemon.json  

systemctl restart docker

sed -i -e 's/DEFAULT_FORWARD_POLICY="DROP"/DEFAULT_FORWARD_POLICY="ACCEPT"/g' /etc/default/ufw
ufw reload
iptables -t nat -A POSTROUTING ! -o docker0 -s 172.18.0.0/16 -j MASQUERADE

ufw allow in on docker0
ufw route allow in on docker0
ufw route allow out on docker0

docker run hello-world
```



```
# Add root to the /etc/aliases file and add the msmtprc file to /etc
apt -y install msmtp msmtp-mta mailutils
hostname overleaf.fb1.uni-bremen.de
cat /etc/hostname
vi /etc/msmtprc
chmod 644 /etc/msmtprc
touch /var/log/msmtp.log
chmod 666 /var/log/msmtp.log
# ln -s /usr/bin/msmtp /usr/sbin/sendmail

# echo "Test message" | mail -s "Test subject" root
```


```
ufw allow 443
ufw allow 80
```
