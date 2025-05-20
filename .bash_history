bash <(curl -s https://pterodactyl-installer.se)
apt update
exit
apt install curl
sudo nano /etc/apt/sources.list
sudo ufw disable
sudo systemctl stop ufw
sudo systemctl disable ufw
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
sudo iptables -t mangle -F
sudo iptables -t mangle -X
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo nft flush ruleset
sudo systemctl disable netfilter-persistent
sudo systemctl stop netfilter-persistent
sudo iptables-legacy -F
sudo iptables-legacy -X
sudo iptables-legacy -t nat -F
sudo iptables-legacy -t nat -X
sudo iptables-legacy -t mangle -F
sudo iptables-legacy -t mangle -X
sudo iptables-legacy -P INPUT ACCEPT
sudo iptables-legacy -P FORWARD ACCEPT
sudo iptables-legacy -P OUTPUT ACCEPT
exit
