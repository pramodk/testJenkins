#!/bin/bash

set -x

# Directory under which packages will be deployed
cd ./bbp/
echo `pwd`

# Deployment directory
BASE_DIR=`pwd`
DEPLOYMENT_HOME=$BASE_DIR/softwares/$(date '+%d-%m-%Y')

mkdir -p $DEPLOYMENT_HOME
mkdir -p $DEPLOYMENT_HOME/sources
mkdir -p $DEPLOYMENT_HOME/install

export HOME=$DEPLOYMENT_HOME

# Clone spack repository
cd $DEPLOYMENT_HOME/sources
[[ -d spack ]] || git clone https://github.com/BlueBrain/spack.git

# Setup environment
export SPACK_ROOT=`pwd`/spack
export PATH=$SPACK_ROOT/bin:$PATH

# Copy configurations
mkdir -p $SPACK_ROOT/etc/spack/defaults/cray/
cp $SPACK_ROOT/sysconfig/daint/* $SPACK_ROOT/etc/spack/defaults/cray/

# Directory for deployment
export SOFTS_DIR_PATH=$DEPLOYMENT_HOME/install

set +x
source $SPACK_ROOT/share/spack/setup-env.sh
module swap PrgEnv-cray PrgEnv-intel
module load daint-mc
set -x

# mod2c test packages
spack spec -Il mod2c
spack install mod2c
