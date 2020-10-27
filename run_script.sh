#!/bin/bash


# Directory under which packages will be deployed
cd ./bbp/
echo `pwd`

module load swap PrgEnv-cray PrgEnv-intel
module load daint-mc cray-python/3.8.2.1 PyExtensions/python3-CrayGNU-20.08

set -x

rm -rf nrn_env
python -mvenv nrn_env
. ./nrn_env/bin/activate
pip install neuron

python -c 'import platform; print("==> Starting On NODE: ", platform.node());'
python -c 'import neuron; neuron.test();'
python -c 'import platform; print("==> Ending On NODE: ", platform.node());'
