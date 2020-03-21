count=0
num=`wc -l $1 |grep -Eo '[0-9]*'`
while (( $count < $num ))
do 
    count=`expr $count + 1`
    array=(`sed -n ${count}p $1`)
    echo ${array[@]}      #这一行等于awk里的{print $0}
   # echo ${array[1]}     #这一行等于awk里的{print $1}
   # echo ${array[2]}     #这一行等于awk里的{print $2}
done
