Repository of version tagged passivedns images for research and comparison.
passivedns is in /usr/local/bin.

Obtain image:
```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build passivedns/1.2.0
Or
$ docker pull opennsm/passivedns:1.2.0
Or, build all passivedns versions:
$ ./containnsm groupbuild passivedns
```

Run passivedns through PCAP file on host and write dns log on the host
```
$ ./containnsm run -I passivedns -r ~/pcaps/nitroba.pcap -- passivedns -r nitroba.pcap -l $PWD/dns.log

    [*] PassiveDNS 1.2.0
    [*] By Edward Bjarte Fjellskål <edward.fjellskaal@gmail.com>
    [*] Using libpcap version 1.6.2
    [*] Using ldns version 1.6.17
    [*] Reading from file nitroba.pcap


    -- Total DNS records allocated            :         598
    -- Total DNS assets allocated             :        1043
    -- Total DNS packets over IPv4/TCP        :           0
    -- Total DNS packets over IPv6/TCP        :           0
    -- Total DNS packets over TCP decoded     :           0
    -- Total DNS packets over TCP failed      :           0
    -- Total DNS packets over IPv4/UDP        :        2578
    -- Total DNS packets over IPv6/UDP        :           0
    -- Total DNS packets over UDP decoded     :        1413
    -- Total DNS packets over UDP failed      :        1165
    -- Total packets received from libpcap    :        2905
    -- Total Ethernet packets received        :        2905
    -- Total VLAN packets received            :           0

    [*] passivedns ended.

$ file dns.log
1216691467.389299||192.168.1.64||192.168.1.254||IN||www.google.com.||CNAME||www.l.google.com.||540811||1
1216691467.389299||192.168.1.64||192.168.1.254||IN||www.l.google.com.||A||74.125.19.103||286||1
1216691467.389299||192.168.1.64||192.168.1.254||IN||www.l.google.com.||A||74.125.19.147||286||1
1216691467.389299||192.168.1.64||192.168.1.254||IN||www.l.google.com.||A||74.125.19.104||286||1
1216691467.389299||192.168.1.64||192.168.1.254||IN||www.l.google.com.||A||74.125.19.99||286||1
1216691468.373698||192.168.1.64||192.168.1.254||IN||ssl.google-analytics.com.||CNAME||ssl-google-analytics.l.google.com.||26636||1
1216691468.373698||192.168.1.64||192.168.1.254||IN||ssl-google-analytics.l.google.com.||A||209.85.171.97||65||1
1216691468.768180||192.168.1.64||192.168.1.254||IN||www.blogger.com.||CNAME||blogger.l.google.com.||80||1
1216691468.768180||192.168.1.64||192.168.1.254||IN||blogger.l.google.com.||A||72.14.223.191||112||1
1216691479.141145||192.168.1.64||192.168.1.254||IN||f.e.drugstore.com.||CNAME||f.chtah.com.||3600||1
```

Get traffic stats on Docker host's physical eth0 interface and write to log file on host
```
$ ./containnsm run -I passivedns -i -- passivedns -i eth0 -l $PWD/dns.log
```
