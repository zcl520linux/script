#!/bin/bash

file_handling (){
    a=`grep -A $2 -B $2 -w $3 $1`
    num1=`expr $2 + 2 `
    num2=`expr $num1 + $2 - 1`
    b=`echo "$a" |sed -n "1,${2}p;${num1},${num2}p"`
    c=`cat $1 |grep -v "$b"`
    echo "$c"

} 


##$1: filename    $2：Delete the next few lines of the keyword    $3：keywords## 

file_handling $1 $2 $3 
