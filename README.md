# netsys
Management scripts for network configuration, routing tables, firewalls, and VPNs

Required software: <br />
iproute2 <br />
ipcalc <br />
networkd-dispatcher <br />
nftables <br />
openvpn (optional) <br />

Four main applications are: <br />
netsys-dev - used for network interface configuration. Also used by networkd-dispatcher to inform netsys of state changes of managed network interfaces. <br />
netsys-firewall - used for nftables changes. Individual nftable configs are for the most part tied to network interfaces and added or removed based on network interface state changes. <br />
netsys-rulesets - used for routing table configuration. Configs are also closely tied to state changes in network interfaces though not dependent. <br />
netsys-vpn - used for openvpn service management. Individual network interface management, Routing Rulesets, and Firewall configurations can be configured for each VPN link. VPN tunnels are often brought up/down dependent on network interface state changes. <br />

Default configuration locations are: <br />
netsys-dev - /usr/lib/netsys/dev <br />
netsys-firewall - /usr/lib/netsys/firewall <br />
netsys-rulesets - /usr/lib/netsys/rulesets <br />
netsys-vpn - /usr/lib/netsys/vpn <br />

Default logging (same sub-directory structure as config location): /run/netsys

2021/06/05 -> Still in pre-beta. Some rough edges around documentation, logging, and configuration management need smoothed out a bit. <br />
  Known issues: <br />
  -> netsys-firewall: removal of rules is terribly slow. A combination of less recursive funtions which use local variables & better management of the current nftables state is needed. Currently each time a firewall change is made, almost the entire state of the firewall rules is loaded into associative arrays. <br />
  -> netsys-rulesets: verbose logging 'debug mode' has some minor issues. Log message 'templates' thrown into printf need some cleaning. <br />
  -> all (except netsys-firewall): configurations are loaded by sourcing scripts which act as configuration scripts. While this is convenient, obvious security issues arise. <br />
