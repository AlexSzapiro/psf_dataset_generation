#!/bin/bash
#SBATCH --job-name="psf_data_gen"
#SBATCH --mail-user=alex.szapiro@cea.fr
#SBATCH --mail-type=END,FAIL
#SBATCH --partition=htc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=64
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH --output=logs/psf_data_gen-%j.log

# Activate conda environment
module load anaconda
source activate $ANACONDA_DIR

# echo des commandes lancees
set -x

# Change location
cd /feynman/home/dap/lcs/as274094/work/psf_dataset_generation/

# Run code
srun gen-SR-PSF-parallel-GT100.py

# Return exit code
exit 0