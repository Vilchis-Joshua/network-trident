# network-trident
TridentGuard integrates Pi-hole for ad-blocking, Unbound DNS for enhanced privacy and security, and Wireguard for secure, high-performance VPN tunneling. This comprehensive solution fortifies your network against unwanted ads, improves your DNS query privacy, and ensures secure, encrypted communications.

This is something that I came up with and is similar to other projects and draws a lot of ideas (mainly wirehole). There may be better implementations, but this has been a simple, fast and easy setup for me. This project defaults as full tunnel VPN service. If you want to to do a split tunnel, you need to adjust the WG_ALLOWED_IPS variable

## Setup
1) Adjust the WG_PEERS variable in the 

2) Run the setup.sh file

3) For whatever reason, I've not been able to get environment variables to take well when setting up the pihole portion. For now, I simply login to pihole (utilizing the auto-generated password from the setup script), navigate to the DNS page, unlick the google dns references and simply put the unbound address twice. I don't put spaces. Input line one, enter paste.

```log
10.4.0.2#53
10.4.0.2#53
```

4) Add lists to pihole that you would like and update gravity
* example list     https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts

5) Ensure that 51820 is forwarded

6) Connect wireguard to device

7) Confirm device is connected
* Before VPN
```
nslookup pornhub.com
```
* After VPN should give results that look something like 
```
Name:	pornhub.com
Address: 0.0.0.0
Name:	pornhub.com
Address: ::
```




### Useful Commands
```sh
sudo rm -rf /location_of_data/wireguard/config/peer* # delete current peer configs to recreate
docker exec -it wireguard mkdir -p /config/peer1 /config/peer2 # input amount of number of course
docker exec -it wireguard /app/init-peer 1
docker exec -it wireguard /app/show-peer 1 4 5 
```
