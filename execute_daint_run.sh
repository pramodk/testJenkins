ssh daint "srun -N1 --partition=debug --constraint=mc --ntasks-per-node=1 --time 0:30:00 ~/bbp/run_script.sh"

