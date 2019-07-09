
## This script divides all dosage files into directories by chromosome.

## dos_ctr_csfct_eur_lo-qc1.hg19.ch.fl.chr


import os
import sys
from shutil import copyfile
import glob

for i in range(1, 23):
    newdir = "chr_"+ str(i)+"/"
    if not(os.path.exists(newdir)):
        os.mkdir(newdir)
    for file in glob.glob("dos_ctr_csfct_eur_lo-qc1.hg19.ch.fl.chr"+str(i)+"_*"):
        copyfile(file, newdir+file)
        os.remove(file)


