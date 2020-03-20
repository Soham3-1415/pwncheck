#!/bin/bash
HASH=`echo -n "$1" | sha1sum`
A=`echo ${HASH:0:5}`
B=`echo ${HASH:5:35}`
RESULT=`curl -s 'https://api.pwnedpasswords.com/range/'"$A" | grep ${B^^}`
RESULT=${RESULT:36}
[ -z "$RESULT" ] && echo 0 || echo $RESULT
