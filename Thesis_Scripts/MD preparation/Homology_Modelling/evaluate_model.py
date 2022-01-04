from modeller import *
from modeller.scripts import complete_pdb

# ADD NAME OF THE BEST MODEL PDB FILE
best_model = 'best_model_single.pdb'

log.verbose()    # request verbose output
env = environ()
env.libs.topology.read(file='$(LIB)/top_heav.lib') # read topology
env.libs.parameters.read(file='$(LIB)/par.lib') # read parameters

# read model file
mdl = complete_pdb(env, best_model)

# Assess with DOPE:
s = selection(mdl)   # all atom selection
s.assess_dope(output='ENERGY_PROFILE NO_REPORT', file='best_model_single.profile',
              normalize_profile=True, smoothing_window=15)
