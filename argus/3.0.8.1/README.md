Repository of version tagged Argus images for research and comparison.
Includes Argus server and client tools compiled from source. 
Programs are in /opt.

Obtain image:
```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build argus/3.0.8.1
Or
$ docker pull opennsm/argus:3.0.8.1
Or, build all argus versions:
$ ./containnsm groupbuild argus
```

Process argus data file on host and display results to stdout
```
$ ./containnsm run -I argus:3.0.8 -r $PWD/test.argus  -- ra -nr test.argus
...
         StartTime      Flgs  Proto            SrcAddr  Sport   Dir            DstAddr  Dport  TotPkts   TotBytes State
   04:37:27.662651  e        ipv6-*                 ::.135       ->  ff02::1:ffed:4c8a               1         78   NNS
   04:37:28.037017  e        ipv6-*                 ::.143       ->           ff02::16               2        180   UNK
   04:37:28.272373  e        ipv6-*                 ::.135       ->    ff02::1:ff11:7e               1         78   NNS
   04:37:28.662763  e        ipv6-* fe80::300a:eaff:f*.143       ->           ff02::16               2        180   UNK
   04:37:28.662798  e        ipv6-* fe80::300a:eaff:f*.133       ->            ff02::2               1         70   NRS
   04:37:29.275955  e        ipv6-* fe80::42:acff:fe1*.143       ->           ff02::16               1         90   UNK
   04:37:29.275999  e        ipv6-* fe80::42:acff:fe1*.133       ->            ff02::2               1         70   NRS
   04:37:27.662651  e        ipv6-*                 ::.135       ->  ff02::1:ffed:4c8a               1         78   NNS
   04:37:28.037017  e        ipv6-*                 ::.143       ->           ff02::16               2        180   UNK
   04:37:28.272373  e        ipv6-*                 ::.135       ->    ff02::1:ff11:7e               1         78   NNS
   04:37:28.662763  e        ipv6-* fe80::300a:eaff:f*.143       ->           ff02::16               2        180   UNK
   04:37:28.662798  e        ipv6-* fe80::300a:eaff:f*.133       ->            ff02::2               1         70   NRS
   04:37:29.275955  e        ipv6-* fe80::42:acff:fe1*.143       ->           ff02::16               1         90   UNK
   04:37:29.275999  e        ipv6-* fe80::42:acff:fe1*.133       ->            ff02::2               1         70   NRS

```

Create an ARGUS data file from a PCAP on the host
```
./containnsm run -I argus:3.0.8 -r $PWD/test.pcap -- argus -r test.pcap -w test.argus
```

Run latest argus on Docker hosts's physical eth0 interface and write file to host
```
$ ./containnsm run -I argus -i -- argus -i eth0 -w $PWD/out.argus
  ArgusWarning: 05 Dec 15 08:42:51.618367 started
  ArgusWarning: 05 Dec 15 08:42:51.697570 ArgusGetInterfaceStatus: interface eth0 is up
^C

$ file out.argus
out.argus: DBase 3 data file with memo(s)
```
