Repository of version tagged speedometer images for research and comparison.
Speedometer is in /usr/local/bin.

Obtain image:

```
$ git clone https://github.com/open-nsm/ContainNSM && cd ContainNSM
$ ./containnsm build speedometer/2.8
Or
$ docker pull opennsm/speedometer:2.8
Or, build all speedometer versions:
$ ./containnsm groupbuild speedometer
```

Get traffic stats on Docker host's eth0 interface.

```
$ ./containnsm run -I speedometer:2.8 -i -- speedometer  -rx eth0 -p
...
 179 B/s   c: 179 B/s   A: 179 B/s   (...::\               )
 249 B/s   c: 202 B/s   A: 225 B/s   (...:::\              )
   0 B/s   c: 171 B/s   A: 135 B/s   (\                    )
   0 B/s   c: 117 B/s   A:  96 B/s   (\                    )
   0 B/s   c:  73 B/s   A:  75 B/s   (\                    )
  69 B/s   c:  51 B/s   A:  74 B/s   (...::\               )
   0 B/s   c:  32 B/s   A:  62 B/s   (\                    )
   0 B/s   c:  17 B/s   A:  54 B/s   (\                    )
   0 B/s   c:  13 B/s   A:  47 B/s   (\                    )
```
