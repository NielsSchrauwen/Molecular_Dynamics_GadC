file = open("mut05_snap_radius.dat","r")
lines=file.readlines()
allaa = []
coordinates = [float(56.050), float(57.550), float(57.050),float(58.550),float(58.050)]

for line in lines:
    if line.startswith("#"):
        continue
    if line.startswith("\n"):
        continue
    if float(line[16:22]) in coordinates:
        line_word = line.lower().replace(',',' ').replace('\n',' ').split(' ')[8:10];
        allaa.append(line_word[1])
        allaa.append(line_word[0])
unique = sorted(set(allaa))

counts= [0] * len(unique)
for number in range(0,len(unique)):
    counts[number] = allaa.count(unique[number])
counts, unique = zip(*sorted(zip(counts,unique)))
print(unique)
print(counts)

with open("mut05_snap_residues_bindingsite.txt", "w")as f:
	f.write("#Unique residues lining the outward open binding site and how many times they are present in the trajectory")
	for x in range(0, len(unique)):
		f.write("\n%s\t%s" % (unique[x], counts[x]))