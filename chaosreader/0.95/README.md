A open source tool to trace TCP/UDP/... sessions and fetch application data from snoop or tcpdump logs.
Easy to use with ./containnsm tool.

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build chaosreader/0.95
Or
$ docker pull opennsm/chaosreader:0.95
Or, build all chaosreader versions:
$ ./containnsm groupbuild chaosreader
```

Process PCAP from host
```
$ ./containnsm run -r $PWD/nitroba.pcap -I chaosreader:0.95 -- chaosreader nitroba.pcap
...
Chaosreader ver 0.95.10
Opening, nitroba.pcap

Reading file contents,
                                      100% (56795590/56795590)
Reassembling packets,
 100% (90943/91144)

Creating files...
   Num  Session (host:port <=> host:port)              Service
  1420  192.168.15.4:33786,69.22.167.198:80            http
  2053  192.168.15.4:35058,72.247.171.161:443          https
  2584  192.168.15.4:36190,216.113.181.30:80           http
  2160  192.168.15.4:35264,209.123.229.231:80          http
  1897  192.168.15.4:34746,69.22.167.239:80            http
  1855  192.168.15.4:34668,206.55.125.137:80           http
```
