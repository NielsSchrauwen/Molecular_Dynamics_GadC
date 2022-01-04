file = open("mut02_snap_radius.dat","r")
lines = file.readlines()

frame = -2

with open("mut02_coordinates_channel.txt","w") as f:
    for line in lines:
        if line.startswith("#"):
            frame = frame + 1
            continue
        if line.startswith("\n"):
            continue
        if frame % 100 == 0:
            f.write("\n%s\t%s\t%s" % (line[16:22], line[24:29], frame))