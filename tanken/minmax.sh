#!/bin/sh

filter=`date +%Y%m%d`
[ $1 ] && filter=$1

grep $filter tanken.log | \
     awk ' { if (min=="") min=max=mindate=maxdate=$3; 
     if ($3 > max) {max=$3 ; maxdate=$1 " " $2}; 
     if ($3 < min) {min=$3 ; mindate=$1 " " $2} ; 
     }

     END { printf "diesel \r\nmin %s %s \r\nmax:%s %s \r\n", min, mindate , max , maxdate } '
