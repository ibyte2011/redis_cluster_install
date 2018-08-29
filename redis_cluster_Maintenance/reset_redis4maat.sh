#!/bin/sh
host="10.172.116.10"
port="6379"
cout=1
echo "Reseting Redis For Maat..."
for ((i=0;i<16;i++))
do
	v=`redis-cli -h $host -p $port -n $i GET MAAT_VERSION`
        #echo $v
	if [ ! $v ]
	then
		((v=0))
	else
        	((v=$v+1))
	fi
	#echo $v
	#echo $p
	redis-cli -h $host -p $port -n $i FLUSHDB
	redis-cli -h $host -p $port -n $i SET MAAT_VERSION $v
	redis-cli -h $host -p $port -n $i SET SEQUENCE_REGION "1"
	redis-cli -h $host -p $port -n $i SET SEQUENCE_GROUP "1"
done
