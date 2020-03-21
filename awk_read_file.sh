####模拟awk读取文件
##awk例子：awk BEGIN{print “zhaocl”}{print $0}END{print $0} test.txt


##shell例子如下：
#cat awk_read_file.sh   执行是：awk_read_file.sh file
count=0
num=`wc -l $1 |grep -Eo '[0-9]*'`

echo "zhaocl"             #模拟awk的BEGIN{print “zhaocl”}
while (( $count < $num ))
do 
    count=`expr $count + 1`
    array=(`sed -n ${count}p $1`)
    echo ${array[@]}      #这一行等于awk里的{print $0}
   # echo ${array[1]}     #这一行等于awk里的{print $1}
   # echo ${array[2]}     #这一行等于awk里的{print $2}
done
echo ${array[@]}          #模拟awk的END{print $0}
