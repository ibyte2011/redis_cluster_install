#./redis-trib.rb  10.0.6.1:9012 10.0.6.1:9013 10.0.6.1:9014 10.0.6.1:9015 10.0.6.1:9016 10.0.6.1:9017 10.0.6.1:9018 10.0.6.1:9019 10.0.6.1:9020 10.0.6.1:9021 10.0.6.1:9022 10.0.6.1:9023 10.0.6.1:9024 10.0.6.1:9025 10.0.6.1:9026 10.0.6.1:9027
#!/bin/bash
#!/bin/bash
if [ $# -lt 1 ];then
        echo -e "usage:\n\tbuild_cluster.sh redis_instance_num\nexample:\n\tbuild_cluster.sh 16"
        exit 1
fi
((n = $1))
slot_num=16384
s=9001
host=127.0.0.1
#redis-cli -p $s -c
m=`expr $slot_num / $n`
echo "m value:"$m
for((i=1;i<$n;i++));
do
	((p=$s+$i))
	#echo "i value:"$i
	redis-cli -h $host -p $s -c cluster meet $host $p >>/dev/null
done
for((i=0;i<$n;i++))
do
	((p=$s+$i))
	for((j=$i*m;j<($i+1)*m;j++))
	do
		#echo "j value":$j
		redis-cli -h $host -p $p cluster addslots $j >>/dev/null
	done
done
