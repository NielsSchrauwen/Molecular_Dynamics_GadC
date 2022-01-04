from modeller import *

env = environ()
aln = alignment(env)
mdl = model(env, file='template', model_segment=('FIRST:A','LAST:A'))
aln.append_model(mdl, align_codes='templateA', atom_files='template.pdb')
aln.append(file='target.ali', align_codes='target')
aln.align2d()
aln.write(file='target-templateA.ali', alignment_format='PIR')
aln.write(file='target-templateA.pap', alignment_format='PAP')
