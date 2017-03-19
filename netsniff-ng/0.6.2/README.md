Repository of version tagged Netsniff-ng images for research and comparison.
Programs are in /usr/local/sbin/.

Obtain images

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build netsniff-ng/0.6.2
Or
$ docker pull opennsm/netsniff-ng:0.6.2
Or, build all speedometer versions:
$ ./containnsm groupbuild netsniff-ng
```

Run latest netsniff-ng on Docker hosts's physical eth0 interface

```
$ ./containnsm run -I netsniff-ng:0.6.2 -i -- netsniff-ng --in eth0
...
M eth0 78 1449207436s.567583516ns #1
 [ Eth MAC (2e:b7:58:ff:14:a7 => 33:33:ff:ff:14:a7), Proto (0x86dd, IPv6) ]
 [ Vendor (Unknown => Multicast) ]
 [ IPv6 Addr (:: => ff02::1:ffff:14a7), Version (6), TrafficClass (0), FlowLabel (0), Len (24), NextHdr (58), HopLimit (255) ]
    [ Geo (local => local) ]
 [ ICMPv6 Neighbor Solicitation (135), Unknown Code (0), Chks (0xcd23), Reserved (0x0), Target Address: fe80::2cb7:58ff:feff:14a7 ]

> eth0 78 1449207436s.859295267ns #2
 [ Eth MAC (02:42:ac:11:00:bc => 33:33:ff:11:00:bc), Proto (0x86dd, IPv6) ]
 [ Vendor (Unknown => Multicast) ]
 [ IPv6 Addr (:: => ff02::1:ff11:bc), Version (6), TrafficClass (0), FlowLabel (0), Len (24), NextHdr (58), HopLimit (255) ]
    [ Geo (local => local) ]
 [ ICMPv6 Neighbor Solicitation (135), Unknown Code (0), Chks (0xcf4a), Reserved (0x0), Target Address: fe80::42:acff:fe11:bc ]
```

Run bpf code on host through bpfc in a container

```
$ cat arp.bpf
ldh [12]
jne #0x806, drop
ret #-1
drop: ret #0

$ ./containnsm run -I netsniff-ng:0.6.2 -r $PWD/arp.bpf -- bpfc --in arp.bpf
{ 0x28, 0, 0, 0x0000000c },
{ 0x15, 0, 1, 0x00000806 },
{ 0x6, 0, 0, 0xffffffff },
{ 0x6, 0, 0, 0x00000000 },
```

Perform a TCP tracroute to google.com using astraceroute from container

```
$ ./containnsm run -I netsniff-ng:0.6.2 -- astraceroute -H google.com
...
AS path IPv4 TCP trace from 172.17.0.194 to 216.58.216.238:80 (google.com) with len 40 Bytes, 30 max hops
Using flags SYN:0,ACK:0,ECN:0,FIN:0,PSH:0,RST:0,URG:0
 1: t[     14 us] 172.17.42.1
 2: i[    967 us] 10.0.2.2
...
```
