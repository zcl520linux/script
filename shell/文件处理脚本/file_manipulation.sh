#!/bin/bash

file_handling (){
    a=`grep -B $2 -A $3 -w $4 $1`
    num1=`expr $2 + 2 `
    num2=`expr $num1 + $3 - 1`
    b=`echo "$a" |sed -n "1,${2}p;${num1},${num2}p"`
    c=`cat $1 |grep -v "$b"`
    echo "$c"

} 


#  $1: filename    |$2：Delete the above line    |$3: Delete the following lines    |$4：reserved keyword.

file_handling $1 $2 $3 $4
