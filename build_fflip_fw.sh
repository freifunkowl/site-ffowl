#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Collimas at 2015-11-07

# Variables ###################################################################
RELEASE="v2015.1.2"
DIR=`pwd`
SITES=(`ls $DIR/sites`)
# SITES=(BO BS LIP) # Used for testing
CORES=4 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

rm -rf gluon
git clone https://github.com/freifunk-gluon/gluon.git gluon -b $RELEASE
cp $DIR/sign.sh $DIR/gluon/contrib/
mkdir gluon/site

for SITE in "${SITES[@]}"
  do
    cp $DIR/sites/$SITE/site.* $DIR/gluon/site/
    cd gluon
    make update
    make clean GLUON_TARGET=ar71xx-generic
    make clean GLUON_TARGET=ar71xx-nand
    make clean GLUON_TARGET=mpc85xx-generic
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic # V=s
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand # V=s
    make -j$CORES GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic # V=s
    make manifest GLUON_BRANCH=stable
    make manifest GLUON_BRANCH=experimental
    ./contrib/sign.sh $SECRET images/sysupgrade/stable.manifest
    ./contrib/sign.sh $SECRET images/sysupgrade/experimental.manifest
    mkdir -p images/$SITE
    mv -f images/factory images/$SITE/
    mv -f images/sysupgrade images/$SITE/
    rm -rf site/*
done

cd /$DIR/gluon/images/
find . -type f -print0 | xargs -0 md5sum > /tmp/MD5SUM; mv /tmp/MD5SUM ./MD5SUM 

exit
