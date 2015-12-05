Repository of version tagged daemonlogger images for research and comparison.
Program is in /opt/bin

Obtain images:

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build daemonlogger/1.2.1
Or
$ docker pull opennsm/daemonlogger:1.2.1
Or, build all daemonlogger versions:
$ ./containnsm groupbuild daemonlogger
```

Log packets on Docker host's physical eth0 interface using latest Daemonlogger image

```
$ ./containnsm run -I daemonlogger -i -- daemonlogger -i eth0  -l $PWD
...
[-] Interface set to eth0
[-] Logpath set to /Users/jonschipp/repos/nsm-containnsm
[-] Log filename set to "daemonlogger.pcap"
[-] Pidfile configured to "daemonlogger.pid"
[-] Pidpath configured to "/var/run"
[-] Rollover size set to 18446744071562067968 bytes
[-] Rollover time configured for 0 seconds
[-] Pruning behavior set to oldest IN DIRECTORY

-*> DaemonLogger <*-
Version 1.2.1
By Martin Roesch
(C) Copyright 2006-2007 Sourcefire Inc., All rights reserved

Checking partition stats for log directory "/Users/jonschipp/repos/nsm-containnsm/."
sniffing on interface eth0
Logging packets to /Users/jonschipp/repos/nsm-containnsm/daemonlogger.pcap.1449306337

$ file daemonlogger.pcap.1449306337
daemonlogger.pcap.1449306337: tcpdump capture file (little-endian) - version 2.4 (Ethernet, capture length 65535) 
```
