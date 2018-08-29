ip_file="./all_sh"
cmd_file="find_client_output_list.sh"
ifile = open(ip_file)
cfile = open(cmd_file, "w")
cmd3 = ' info clients'
#cmd4 = ' config rewrite'
port = 9001
instance_num = 16
for line in ifile:
	data = line.replace("\n","")
	for i in range(instance_num):
		cfile.write("echo -n "+data+":"+str(port+i)+"\n")
                cfile.write("../redis-cli -h "+data+" -p "+str(port+i)+cmd3+"\n")
                #cfile.write("../redis-cli -h "+data+" -p "+str(port+i)+cmd4+"\n")
ifile.close()
cfile.close()

	
