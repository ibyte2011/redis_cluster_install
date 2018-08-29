slave = open('./index_slave_gd')
master = open('./index_master_gd')
slave_ip = slave.readlines()
res = "ruby redis-trib_fixed.rb create --replicas 1 "

for line in master:
	for i in range(16):
		res += line.replace('\n','')+":"+str(9001+i)+" "

for i in range(len(slave_ip)):
	for j in range(16):
		res += slave_ip[i].replace('\n', '')+":"+str(9001+j)+" "

print res
		
