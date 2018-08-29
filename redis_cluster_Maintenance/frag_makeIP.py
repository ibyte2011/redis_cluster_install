ifile = open('index_master_gd')
res = ""
for line in ifile:
	tmp = line.strip('\n')+':9001,'
	res += tmp
print res 
