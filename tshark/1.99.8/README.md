Repository of version tagged Tshark images for research and comparison.
Includes all the small programs that come with wireshark package. Tshark was compiled with profiling support.
Programs are in /opt.

Obtain image:

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build tshark/3.0.8.1
Or
$ docker pull opennsm/tshark:3.0.8.1
Or, build all tshark versions:
$ ./containnsm groupbuild tshark
```

Run latest tshark through PCAP and print to stdout
```
$ ./containnsm run -I tshark -r $PWD/test.pcap -- tshark -r test.pcap
...
  1   0.000000           :: -> ff02::1:ffed:4c8a ICMPv6 78 Neighbor Solicitation for fe80::300a:eaff:feed:4c8a
  2   0.374366           :: -> ff02::16     ICMPv6 90 Multicast Listener Report Message v2
  3   0.512221           :: -> ff02::16     ICMPv6 90 Multicast Listener Report Message v2
  4   0.609722           :: -> ff02::1:ff11:7e ICMPv6 78 Neighbor Solicitation for fe80::42:acff:fe11:7e
  5   1.000112 fe80::300a:eaff:feed:4c8a -> ff02::16     ICMPv6 90 Multicast Listener Report Message v2
  6   1.000147 fe80::300a:eaff:feed:4c8a -> ff02::2      ICMPv6 70 Router Solicitation from 32:0a:ea:ed:4c:8a
  7   1.610816 fe80::300a:eaff:feed:4c8a -> ff02::16     ICMPv6 90 Multicast Listener Report Message v2
  8   1.613304 fe80::42:acff:fe11:7e -> ff02::16     ICMPv6 90 Multicast Listener Report Message v2
  9   1.613348 fe80::42:acff:fe11:7e -> ff02::2      ICMPv6 70 Router Solicitation from 02:42:ac:11:00:7e
```

Listen on Docker host's physical eth0 interface and write to stdout

```
$ ./containnsm run -I tshark -i -- tshark -i eth1
...
Capturing on 'eth1'

  1 0.000000000 0a:00:27:00:00:08 -> Broadcast    ARP 42 Who has 192.168.59.103? Tell 192.168.59.3
  2 0.000029707 CadmusCo_ee:98:aa -> 0a:00:27:00:00:08 ARP 42 192.168.59.103 is at 08:00:27:ee:98:aa
  3 0.003451352 192.168.59.3 -> 192.168.59.103 TCP 96 59092→2376 [PSH, ACK] Seq=1 Ack=1 Win=4096 Len=30 TSval=2209089903 TSecr=7369728
  4 0.004022313 192.168.59.103 -> 192.168.59.3 TCP 97 2376→59092 [PSH, ACK] Seq=1 Ack=31 Win=24 Len=31 TSval=7372270 TSecr=2209089903
  5 0.006700445 192.168.59.3 -> 192.168.59.103 TCP 66 59092→2376 [ACK] Seq=31 Ack=32 Win=4095 Len=0 TSval=2209089909 TSecr=7372270
  6 0.428214436 192.168.59.103 -> 192.168.59.3 TCP 706 2376→59092 [PSH, ACK] Seq=32 Ack=31 Win=24 Len=640 TSval=7372313 TSecr=2209089909
  7 0.428712228 192.168.59.3 -> 192.168.59.103 TCP 66 59092→2376 [ACK] Seq=31 Ack=672 Win=4076 Len=0 TSval=2209090330 TSecr=7372313
  8 0.751253394 192.168.59.3 -> 192.168.59.103 TCP 96 59092→2376 [PSH, ACK] Seq=31 Ack=672 Win=4096 Len=30 TSval=2209090652 TSecr=7372313
```
