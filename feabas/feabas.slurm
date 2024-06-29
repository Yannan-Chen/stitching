#!/usr/bin/env bash
#SBATCH -J 'feabas'
#SBATCH -o %x-%j.out
#SBATCH --time=9-00:00:00
#SBATCH -w sarekl16-8
#SBATCH --exclusive
#SBATCH --mem=0



module load anacondapy/2024.02
conda activate tem

python ~/Code/stitching/feabas/gen_stitch_coord.py /scratch/yannan/TEM/bladeseq-2024.06.26-16.12.30/s017-2024.06.26-16.12.30

python ~/Code/feabas/scripts/stitch_main.py --mode matching 

python ~/Code/feabas/scripts/stitch_main.py --mode optimization

python ~/Code/feabas/scripts/stitch_main.py --mode rendering

