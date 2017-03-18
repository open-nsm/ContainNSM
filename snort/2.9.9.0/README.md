Repository of version tagged Snort images for research and comparison.
Snort is in /opt/bin

Obtain image:

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build snort/2.9.9.0
Or
$ docker pull opennsm/snort:2.9.9.0
Or, build all Snort versions:
$ ./containnsm groupbuild snort
```

Run latest snort through pcap
```
$ ./containnsm run -I snort -r $PWD/test.pcap -- snort -r test.pcap
...
Running in packet dump mode

        --== Initializing Snort ==--
Initializing Output Plugins!
pcap DAQ configured to read-file.
Acquiring network traffic from "test.pcap".

...

Commencing packet processing (pid=1)
WARNING: No preprocessors configured for policy 0.
11/08-04:37:27.662651 :: -> ff02::1:ffed:4c8a
IPV6-ICMP TTL:255 TOS:0x0 ID:0 IpLen:40 DgmLen:64
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+

WARNING: No preprocessors configured for policy 0.
11/08-04:37:28.037017 :: -> ff02::16
IPV6-ICMP TTL:1 TOS:0x0 ID:256 IpLen:40 DgmLen:76
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
...
```

Run snort in packet dump mode on Docker host's physical eth1 interface
```
$ ./containnsm run -I snort:2.9.9.0 -i eth1 -- snort -X -i eth0
Running in packet dump mode
...
Commencing packet processing (pid=1)
12/05-09:34:59.579740 10.0.2.15:49003 -> 54.192.91.38:443
TCP TTL:64 TOS:0x0 ID:40150 IpLen:20 DgmLen:40 DF
***A**** Seq: 0xB8AE07F0  Ack: 0x8D29363F  Win: 0x0  TcpLen: 20
0x0000: 52 54 00 12 35 02 08 00 27 73 69 61 08 00 45 00  RT..5...'sia..E.
0x0010: 00 28 9C D6 40 00 40 06 00 05 0A 00 02 0F 36 C0  .(..@.@.......6.
0x0020: 5B 26 BF 6B 01 BB B8 AE 07 F0 8D 29 36 3F 50 10  [&.k.......)6?P.
0x0030: 00 00 9E 0F 00 00                                ......

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+

12/05-09:34:59.579847 10.0.2.15:42242 -> 54.230.90.147:443
TCP TTL:64 TOS:0x0 ID:50574 IpLen:20 DgmLen:40 DF
***A**** Seq: 0x4E4139BC  Ack: 0x8CFF0B41  Win: 0x0  TcpLen: 20
0x0000: 52 54 00 12 35 02 08 00 27 73 69 61 08 00 45 00  RT..5...'sia..E.
0x0010: 00 28 C5 8E 40 00 40 06 D7 B9 0A 00 02 0F 36 E6  .(..@.@.......6.
0x0020: 5A 93 A5 02 01 BB 4E 41 39 BC 8C FF 0B 41 50 10  Z.....NA9....AP.
0x0030: 00 00 9D A2 00 00                                ......

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
```
