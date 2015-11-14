#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Collimas at 2015-11-14

# Variables ###################################################################
RELEASE="v2015.1.2"
DIR=`pwd`
SITES=(`ls $DIR/sites`)
# SITES=(BO BS LIP) # Used for testing
CORES=3 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

rm -rf gluon
git clone https://github.com/freifunk-gluon/gluon.git gluon -b $RELEASE
cp $DIR/sign.sh $DIR/gluon/contrib/
mkdir gluon/site

for SITE in "${SITES[@]}"
  do
    cp $DIR/sites/$SITE/site.* $DIR/gluon/site/
    cd /home/$USER/fflip-fw/gluon/
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic # V=s
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand # V=s
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic # V=s
    make manifest GLUON_BRANCH=stable
    make manifest GLUON_BRANCH=experimental # to be deleted when experimental branch is no longer used
    ./contrib/sign.sh $SECRET images/sysupgrade/stable.manifest
    ./contrib/sign.sh $SECRET images/sysupgrade/experimental.manifest # to be deleted when experimental branch is no longer used
    mkdir -p images/$SITE
    mv -f images/factory images/$SITE/
    mv -f images/sysupgrade images/$SITE/
    rm -rf site/*
done

exit
