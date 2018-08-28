#!/bin/bash
if [ $# -lt 1 ];then
        echo -e "usage:\n\tprotect.sh redis_instance_num\nexample:\n\tprotect.sh 6"
        exit 1
fi
((n = $1+1))
while true; do
	redis_num=`ps -ef|grep redis-server|wc -l`
	#echo $redis_num
	if [ $redis_num -lt $n ];then
		for dir in $(ls /home/mm/redis/redis-node/)
		do
			[ -d $dir ] && `redis-server /home/mm/redis/redis-node/$dir/redis.conf` 
		done
		#echo program crashed, restart at `date +"%w %Y/%m/%d, %H:%M:%S"` >> RESTART.log
	fi
	sleep 5
done
