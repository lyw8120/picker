#!/bin/bash


if [ $# != 11 ]; then
    echo "please input filename list, the pixel size(mm), exposure time(s), camera length(mm), start angle, angle for each frame, wave length(A), beam center x, beam center y(pixel), data type(unsigned_short), bin size(such as 2)"
    echo "such as"
    echo "mrc2smv.sh list 0.014 6 2150 -30 1 0.0197 512 512 unsigned_short 4"
    exit 1
fi

 n=0

 #angle increment for each frame
 #inc=-0.533
 file=$1 #list
 ps=$2   #0.014 mm
 et=$3   #6 s
 cl=$4   #2150 mm
 sa=$5   #20
 ar=$6   #-0.533
 wl=$7   #0.0197
 bx=$8   #1017 * 0.014
 by=$9   #1098 * 0.014
 dt=${10}  #unsigned_short
 binsize=${11} #2 for example

ara=$ar
 if (( $(echo " 0 > $ar" | bc -l) )) ; then
     ara=`echo " 0 - $ar" | bc`
 fi


 cat $file | while read line
do
    echo ${n}
    nn=`echo "$n * $ar + $sa" | bc`
    bx=`echo "$bx * $ps" | bc`
    by=`echo "$by * $ps" | bc`
    echo $nn
    echo $bx
    echo $by
    #mrc2smv -f $line -ps 1 -b 2x2 -e 6 -a 0 -d 2150 -tt 0 -p 20 -oS $nn -oR 0.533 -w 0.0197 -bx 1024 -by 1024
    mrc2smv -f $line -ps $ps -b "${binsize}x${binsize}" -e $et -a 0 -d $cl -tt 0 -p $nn -oS $nn -oR $ara -w $wl -bx $bx -by $by -dt "$dt"
    n=$((n+1))
done
