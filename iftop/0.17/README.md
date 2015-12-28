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

Run iftop on container interface
```
$ ./containnsm run -I iftop:0.17 -- iftop -i eth0
...
```

Run iftop on Docker host's physical interface from inside container
```
$ ./containnsm run -I iftop:0.17 -i -- iftop -i eth0
...
```
