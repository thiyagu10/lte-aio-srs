### Rules are persistent and stored
apt install iptables-persistent

### Do SNAT for every packet schedlued to be out on this interface (WAN-ens4), LAZY
iptables -t nat -A POSTROUTING -s 172.16.0.0/24 -o ens4 -j MASQUERADE

### Packets received from LAN interfaces (srs_spgw_sgi) to be forwarded through the ens4
iptables -A FORWARD -i srs_spgw_sgi -o ens4 -j ACCEPT

### Packets that are associated with existing connections received on a WAN interface to be forwarded to the LAN 
iptables -A FORWARD -i ens4 -o srs_spgw_sgi -m state --state RELATED,ESTABLISHED -j ACCEPT
