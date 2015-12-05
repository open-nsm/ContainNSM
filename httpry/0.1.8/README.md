Repository of version tagged Httpry images for research and comparison.
Programs are in /usr/sbin/httpry.

Obtain image:

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build httpry/0.1.8
Or
$ docker pull opennsm/httpry:0.1.8
Or, build all httpry versions:
$ ./containnsm groupbuild httpry
```

Process PCAP file and print results to stdout

```
$ ./containnsm run -I httpry:0.1.8 -r $PWD/nitroba.pcap -- httpry -r nitroba.pcap
...
httpry version 0.1.8 -- HTTP logging and information retrieval tool
Copyright (c) 2005-2014 Jason Bittel <jason.bittel@gmail.com>
2008-07-22 01:51:07    192.168.1.64    74.125.19.19    >    GET    mail.google.com    /mail/?logout&hl=en    HTTP/1.1    -    -
2008-07-22 01:51:07    74.125.19.19    192.168.1.64    <    -    -    -    HTTP/1.1    302    Moved Temporarily
2008-07-22 01:51:19    192.168.1.64    65.175.87.70    >    GET    e.drugstore.com    /a/hBIhP7YAbeh5-B7SEoEBNJqOT.AcGxgqbm/spacer.gif    HTTP/1.1    -    -
2008-07-22 01:51:19    192.168.1.64    209.3.183.2    >    GET    f.e.drugstore.com    /i/20/460988031/08wk30_toms_a4.gif    HTTP/1.1    -    -
2008-07-22 01:51:19    192.168.1.64    209.3.183.2    >    GET    f.e.drugstore.com    /i/20/460988031/08wk30_toms_a3.gif    HTTP/1.1
```

Run latest httpry on Docker host's physical eth1 interface and write the results to log file on host

```
$ ./containnsm run -I httpry -i -- httpry -i eth1 -o http.log
httpry version 0.1.8 -- HTTP logging and information retrieval tool
Copyright (c) 2005-2014 Jason Bittel <jason.bittel@gmail.com>
Starting capture on eth1 interface
Writing output to file: http.log

$ file http.log
http.log: ASCII text
```
