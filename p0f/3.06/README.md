Repository of version tagged p0f images for research and comparison.
Programs are in /usr/local/bin/.

Obtain image:

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build p0f/3.06
Or
$ docker pull opennsm/p0f:3.06
Or, build all httpry versions:
$ ./containnsm groupbuild p0f
```

Process PCAP file and print results to stdout

```
$ ./containnsm run -I p0f:3.06  -C /home/opennsm -r /pcaps/nitroba.pcap -- p0f -r ~/pcaps/nitroba.pcap
.-[ 192.168.1.64/36084 -> 69.22.167.215/80 (uptime) ]-
|
| client   = 192.168.1.64/36084
| uptime   = 924 days 11 hrs 59 min (modulo 5523 days)
| raw_freq = 9.84 Hz
|
`----

.-[ 192.168.1.64/36084 -> 69.22.167.215/80 (syn+ack) ]-
|
| server   = 69.22.167.215/80
| os       = Linux 2.4.x
| dist     = 6
| params   = none
| raw_sig  = 4:58+6:0:1408:mss*4,0:mss,sok,ts,nop,ws:df:0
|
`----
...
```

Run latest p0f on Docker host's physical eth0 interface
```
$ ./containnsm run -I p0f:3.06 -u root -i -- p0f -i eth0
...
--- p0f 3.06b by Michal Zalewski <lcamtuf@coredump.cx> ---

[+] Closed 1 file descriptor.
[+] Loaded 314 signatures from 'p0f.fp'.
[+] Intercepting traffic on interface 'eth0'.
[+] Default packet filtering configured [+VLAN].
[+] Entered main event loop.
...
```
