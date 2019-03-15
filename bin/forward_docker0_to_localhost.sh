# https://unix.stackexchange.com/a/112232
sysctl -w net.ipv4.conf.docker0.route_localnet=1

# forward all requests from docker ip range with port 41401 to localhost
# https://unix.stackexchange.com/q/111433
iptables -t nat -I PREROUTING -p tcp -d 172.17.0.0/16 --dport 41401 -j DNAT --to-destination 127.0.0.1:41401
