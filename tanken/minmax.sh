g=`date +%Y%m%d`
[ $1 ] && g=$1

grep $g tanken.log | \
     awk ' { if (min=="") min=max=mindate=maxdate=$3; 
     if ($3 > max) {max=$3 ; maxdate=$1 " " $2}; 
     if ($3 < min) {min=$3 ; mindate=$1 " " $2} ; 
     }

     END { printf "diesel \r\nmin %s %s \r\nmax:%s %s \r\n", min, mindate , max , maxdate } '
