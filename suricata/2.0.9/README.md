Repository of version tagged Suricata images for research and comparison.
Program is in /opt/bin, configs in /etc/suricata

Obtain image:
```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build suricata/3.0.8.1
Or
$ docker pull opennsm/suricata:3.0.8.1
Or, build all suricata versions:
$ ./containnsm groupbuild suricata
```

Print latest suricata version
```
$ ./containnsm run -I suricata -- suricata -V
This is Suricata version 2.0.9 RELEASE
```
