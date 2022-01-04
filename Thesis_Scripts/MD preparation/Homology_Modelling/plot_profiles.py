import pylab
import modeller


def r_enumerate(seq):
    """Enumerate a sequence in reverse order"""
    # Note that we don't use reversed() since Python 2.3 doesn't have it
    num = len(seq) - 1
    while num >= 0:
        yield num, seq[num]
        num -= 1

def get_profile(profile_file, seq):
    """Read `profile_file` into a Python array, and add gaps corresponding to
       the alignment sequence `seq`."""
    # Read all non-comment and non-blank lines from the file:
    f = open(profile_file)
    vals = []
    for line in f:
        if not line.startswith('#') and len(line) > 10:
            spl = line.split()
            vals.append(float(spl[-1]))
    # Insert gaps into the profile corresponding to those in seq:
    for n, res in r_enumerate(seq.residues):
        for gap in range(res.get_leading_gaps()):
            vals.insert(n, None)
    # Add a gap at position '0', so that we effectively count from 1:
    vals.insert(0, None)
    return vals

e = modeller.environ()
a = modeller.alignment(e, file='target-templateA.ali')

template = get_profile('templateA.profile', a['templateA'])
model = get_profile('best_model_single.profile', a['target'])

# Plot the template and model profiles in the same plot for comparison:
pylab.figure(1, figsize=(12,8))
pylab.xlabel('Alignment position')
pylab.ylabel('DOPE per-residue score')
pylab.plot(template, color='blue', linewidth=1, label='template')
pylab.plot(model, color='orange', linewidth=1, label='best_model_single')
pylab.legend()
pylab.savefig('DOPE_profile_best_model.png', dpi=65)
