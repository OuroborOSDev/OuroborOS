#!/bin/sh

set -e

tmp1=`mktemp`
tmp2=`mktemp`
trap "rm -f $tmp1 $tmp2; exit" 0 2 3

nm -t d z80.out > $tmp1

cat <<! > $tmp2
0000000000000000 b .bss
0000000000000000 d .data
0000000000000000 t .text
0000000000000001 B averylongbss
0000000000000001 D averylongdata
0000000000000001 T averylongtext
0000000000000000 B bss1
0000000000000002 b bss3
0000000000000010 C bss4
0000000000000018 C bss5
0000000000000000 D data1
0000000000000002 d data3
0000000000000010 C data4
0000000000000018 C data5
0000000000000000 T text1
0000000000000002 t text3
0000000000000010 C text4
0000000000000018 C text5
                 U text6
!

diff $tmp1 $tmp2
