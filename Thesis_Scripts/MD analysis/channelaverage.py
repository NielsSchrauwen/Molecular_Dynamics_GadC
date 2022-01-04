import numpy
import math

file = open("mut12_10000snap_radius.dat","r")
lines = file.readlines()
allcoords = []
allsize = []

for line in lines:
	if line.startswith("#"):
		continue
	if line.startswith("\n"):
		continue
	allcoords.append(float(line[16:22]))
	allsize.append(float(line[24:29]))

uniquecoords = set(allcoords)
uniquecoords = sorted(uniquecoords)


counts = []
totals = [0] * len(uniquecoords)

for number in range(0,len(uniquecoords)):
	count = allcoords.count(uniquecoords[number])
	counts.append(count)
	for x in range (0, len(allcoords)):
		if uniquecoords[number] == allcoords[x]:
			totals[number] = totals[number] + allsize[x]


totals = numpy.array(totals)
counts = numpy.array(counts)
averages = totals/counts

deviations = [0] * len(uniquecoords)


for number in range(0,len(uniquecoords)):	
	for x in range (0, len(allcoords)):
		if uniquecoords[number] == allcoords[x]:
			deviations[number] = deviations[number] + ((allsize[x]-averages[number]) ** 2)

deviations=numpy.array(deviations)
std = deviations/counts

with open("mut12_channel_averages.txt", "w")as f:
	f.write("#Average channel size by z coordinate")
	for x in range(0, len(averages)):
		f.write("\n%s\t%s\t%s" % (uniquecoords[x], averages[x], std[x]))

