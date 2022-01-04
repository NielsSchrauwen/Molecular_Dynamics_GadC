import numpy
import math

file = open("WT_10000snap_radius.dat","r")
lines = file.readlines()
words = []
allwords = []
aa_ineachframe = []

for line in lines:
	if line.startswith('#'):
		for res in words:
			allwords.append(res)
		aa_ineachframe.append(len(words))		
		words= []
		continue
	line_word = line.lower().replace(',',' ').replace('\n',' ').split(" ")[8:10];
	for w in line_word:
		if w not in words:
			words.append(w)

unique=[]
for res in allwords:
	if res not in unique:
		unique.append(res)
counts = []
for res in unique:
	count = allwords.count(res)
	counts.append(count)

counts = numpy.array(counts)
unique = numpy.array(unique)
inds = counts.argsort()
sortedcounts = counts[inds]
sortedunique = unique[inds]
meanaa_ineachframe = sum(aa_ineachframe)/10000
squared_differenceaa = []
for x in aa_ineachframe[2:]:
	squared_differenceaa.append((x-meanaa_ineachframe)**2)
stdaa_ineachframe = math.sqrt(sum(squared_differenceaa)/10000)

with open("AA_ineachframe.txt", "w") as g:
	for amount in aa_ineachframe:
		g.write("\n%s" % amount)

count=0
with open("WT_residues_10000snap_hole.txt", "w")as f:
	f.write("#Residues lining the channel found using Gromacs clusterbyfeatures hole command")
	f.write("\n#In total we found %s unique residues lining the channel" % len(sortedunique))
	f.write("\n#The mean amount of unique aa in each frame is %s and the std is %s." % (meanaa_ineachframe, stdaa_ineachframe))
	for x in range(len(sortedunique)-1,-1,-1):
		f.write("\n%s\t%s\t%s" % (x+1, sortedunique[x], sortedcounts[x]))
	f.write("\n\n#")
	for x in range(len(sortedunique)-1,len(sortedunique)-1-49,-1):
		resname = sortedunique[x][:3]
		resnumber = int(sortedunique[x][3:6])
		resnumber = resnumber+624
		f.write(" | r %s" % resnumber)
	f.write("\n\n#")
	for x in range(len(sortedunique)-1,len(sortedunique)-1-49,-1):
		resname = sortedunique[x][:3]
		resnumber = int(sortedunique[x][3:6])
		f.write(" or resi %s" %resnumber)
		count= count+1
	f.write("\n#mean+3*std is %s" %count)	
file.close()
