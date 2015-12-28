Repository of version tagged iftop images for research and comparison.

Obtain image:
```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build iftop/0.17/
Or
$ docker pull opennsm/iftop:0.17
Or, build all iftop versions:
$ ./containnsm groupbuild iftop
```

Process iftop data file on host and display results to stdout
```
$ ./containnsm run -I iftop:0.17 -- iftop -i eth0
...
```
