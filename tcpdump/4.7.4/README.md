Repository of version tagged Tcpdump images and corresponding libpcap version for research and comparison.
Program is in /opt.

Obtain image:

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build tcpdump/3.0.8.1
Or
$ docker pull opennsm/tcpdump:3.0.8.1
Or, build all tcpdump versions:
$ ./containnsm groupbuild tcpdump
```


Run latest tcpdump through PCAP on host and print to stdout
```
$ ./containnsm run -I tcpdump -r $PWD/test.pcap -- tcpdump -nr test.pcap
...
reading from file test.pcap, link-type EN10MB (Ethernet)
04:37:27.662651 IP6 :: > ff02::1:ffed:4c8a: ICMP6, neighbor solicitation, who has fe80::300a:eaff:feed:4c8a, length 24
04:37:28.037017 IP6 :: > ff02::16: HBH ICMP6, multicast listener report v2, 1 group record(s), length 28
04:37:28.174872 IP6 :: > ff02::16: HBH ICMP6, multicast listener report v2, 1 group record(s), length 28
04:37:28.272373 IP6 :: > ff02::1:ff11:7e: ICMP6, neighbor solicitation, who has fe80::42:acff:fe11:7e, length 24
04:37:28.662763 IP6 fe80::300a:eaff:feed:4c8a > ff02::16: HBH ICMP6, multicast listener report v2, 1 group record(s), length 28
04:37:28.662798 IP6 fe80::300a:eaff:feed:4c8a > ff02::2: ICMP6, router solicitation, length 16
04:37:29.273467 IP6 fe80::300a:eaff:feed:4c8a > ff02::16: HBH ICMP6, multicast listener report v2, 1 group record(s), length 28
04:37:29.275955 IP6 fe80::42:acff:fe11:7e > ff02::16: HBH ICMP6, multicast listener report v2, 1 group record(s), length 28
04:37:29.275999 IP6 fe80::42:acff:fe11:7e > ff02::2: ICMP6, router solicitation, length 16
```

Run tcpdump on Docker host's physical eth1 interface and print to stdout

```
$ ./containnsm run -I tcpdump -i -- tcpdump -i eth1 -c 4
...
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode listening on eth1, link-type EN10MB (Ethernet), capture size 262144 bytes
09:51:08.958788 IP 192.168.59.103.2376 > 192.168.59.3.58364: Flags [P.], seq 1636735169:1636735349, ack 1267012164, win 24, options [nop,nop,TS val 7299726 ecr 2208378988], length 180
09:51:08.959299 IP 192.168.59.3.58364 > 192.168.59.103.2376: Flags [.], ack 180, win 4090, options [nop,nop,TS val 2208379237 ecr 7299726], length 0 
09:51:09.000577 IP 192.168.59.103.2376 > 192.168.59.3.58364: Flags [P.], seq 180:544, ack 1, win 24, options [nop,nop,TS val 7299730 ecr 2208379237], length 364
09:51:09.003805 IP 192.168.59.103.2376 > 192.168.59.3.58364: Flags [P.], seq 544:735, ack 1, win 24, options [nop,nop,TS val 7299730 ecr 2208379237], length 191
```

Run tcpdump on Docker host's physical eth1 interface and write PCAP to current working directory on host

```
$ ./containnsm run -I tcpdump -i -w $PWD -- tcpdump -i eth1 -w out.pcap
...
tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size 262144 bytes
^C2 packets captured
6 packets received by filter
0 packets dropped by kernel

$ file out.pcap
out.pcap: tcpdump capture file (little-endian) - version 2.4 (Ethernet, capture length 262144)
```
