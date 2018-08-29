ip_file="./single_master_sh"
cmd_file="get_stats_info.sh"
ifile = open(ip_file)
cfile = open(cmd_file, "w")
cmd3 = ' info stats'
#cmd4 = ' config rewrite'
port = 9001
instance_num = 16
for line in ifile:
	data = line.replace("\n","")
	for i in range(instance_num):
		cfile.write("echo -n "+data+":"+str(port+i)+";")
                cfile.write("../redis-cli -h "+data+" -p "+str(port+i)+cmd3+"|grep evicted_keys"+"\n")
                #cfile.write("../redis-cli -h "+data+" -p "+str(port+i)+cmd4+"\n")
ifile.close()
cfile.close()

	
