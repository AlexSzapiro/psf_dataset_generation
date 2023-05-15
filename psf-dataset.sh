#!/bin/bash
#SBATCH --job-name="psf_data_gen"
#SBATCH --mail-user=alex.szapiro@cea.fr
#SBATCH --mail-type=ALL
#SBATCH --partition=htc
#SBATCH --nodes=1
#SBATCH --array=1
#SBATCH --cpus-per-task=24
#SBATCH --time=12:00:00
#SBATCH --mem-per-cpu=10G
#SBATCH --output=psf_data_gen-%j-%a.log

# Activate conda environment
module load anaconda
source activate $ANACONDA_DIR

# echo des commandes lancees
set -x

# Change location
cd /feynman/home/dap/lcs/as274094/work/

# Run code
srun gen-SR-PSF-parallel-GT100.py $SLURM_ARRAY_TASK_ID


# Return exit code
exit 0