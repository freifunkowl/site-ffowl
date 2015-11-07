#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31

# Variables ###################################################################
RELEASE="v2015.1.2"
DIR=`pwd`
SITES=(`ls $DIR/sites`)
# SITES=(BO BS LIP) # Used for testing
CORES=2 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

git clone https://github.com/freifunk-gluon/gluon.git gluon -b $RELEASE
mkdir gluon/site
# cp $DIR/secret $DIR/gluon/

for SITE in "${SITES[@]}"
  do
    cp $DIR/sites/$SITE/site.* $DIR/gluon/site/
    cd gluon
    git pull origin $RELEASE
    make update
    make clean GLUON_TARGET=ar71xx-generic
    make clean GLUON_TARGET=ar71xx-nand
    make clean GLUON_TARGET=mpc85xx-generic
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic # V=s
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand # V=s
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic # V=s
    make manifest GLUON_BRANCH=stable
    ./contrib/sign.sh $SECRET images/sysupgrade/stable.manifest
    mkdir -p images/$SITE
    mv -f images/factory images/$SITE/
    mv -f images/sysupgrade images/$SITE/
    rm -rf site/*
done

exit
