Repository of version tagged Wireshark images for research and comparison.
Includes all the small programs that come with wireshark package. Wireshark was compiled with profiling support. Programs are in /opt.

Obtain image:

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build argus/3.0.8.1
Or
$ docker pull opennsm/argus:3.0.8.1
Or, build all argus versions:
$ ./containnsm groupbuild argus
```

Use is expirmental, check back soon for examples.
