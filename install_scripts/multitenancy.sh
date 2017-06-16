## Set up multitenancy for Hyku

# dnsmasq (for resolving localhost subdomains)
apt-get -y install dnsmasq

echo "address=/localhost/127.0.0.1" > /etc/dnsmasq.d/localhost.conf

sed -i -e 's/#prepend domain-name-servers 127.0.0.1;/prepend domain-name-servers 127.0.0.1;/' /etc/dhcp/dhclient.conf

service dnsmasq restart
dhclient
