import os

home = '/home/nikolina/Niels/Example/'
file_name = 'gadcmut01_ch2amb'

pdb_file = os.path.join(home, file_name + '.pdb')
f = open(pdb_file, 'r')

with open(os.path.join(home, file_name + '_vmd2amb.pdb'),'w', newline='') as n:
    for line in f:

        # if line contains lipid part, solvent or TER/END, write it down in output file

        if ('PA' in line[17:20]) or ('PE' in line[17:20]) or ('OL' in line[17:20]) or ('WAT' in line[17:20]) \
                or ('Cl-' in line[17:20]) or ('   ' in line[17:20]):

            print(line.strip('\n'), file=n)


        # else line contains protein
            # if HSD/HSE/HSP > HID/HIE/HIP
            # if line is H atom, skip it

        else:

            line = line.replace('HSD', 'HID')
            line = line.replace('HSE', 'HIE')
            line = line.replace('HSP', 'HIP')

            if ('H' in line[12:14]) or (line[13:15] == 'CD' and line[17:20] == 'ILE'):
                pass

            else:
                print(line.strip('\n'), file=n)







