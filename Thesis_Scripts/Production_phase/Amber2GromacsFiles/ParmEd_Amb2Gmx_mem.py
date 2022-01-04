import parmed as pmd
import os
import re
import glob

path= 'C:/users/niels/thesis/Amb2gmx/mut13_good'
allFiles = glob.glob(path + "/*.top")

for file in allFiles:
	name = os.path.splitext(os.path.basename(file))[0][0:-9]

print("System name: "+ name)

amber = pmd.load_file(name+'_tleapout.top', name+'_md5ns.rst')
amber.save(name+'_5ns.top')
amber.save(name+'_5ns.gro')

print('Transfer to Gromacs files done!')
print('')
print('Use the following line to make index file:')
print('gmx make_ndx -f '+name+'_5ns.gro -o '+name+'_5ns_index.ndx')
print('')
print('Use the following line to make tpr file:')
print('gmx_mpi grompp -f NPT.mdp -c '+name+'_5ns.gro -n '+name+'_5ns_index.ndx -p '+name+'_5ns.top -o '+name+'_5ns.tpr')

