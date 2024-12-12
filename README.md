I am slowly distroying this repo. Most of it is updated and migrated here: 

https://github.com/davrot/HajTex_living_with_keycloak


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
