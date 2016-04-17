#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Collimas at 2016-04-06

# Variables ###################################################################
RELEASE="v2016.1.3"
DIR=`pwd`
SITES=(`ls $DIR/sites`)
# SITES=(BO BS LIP) # Used for testing
CORES=3 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

$DIR/mksites.sh
rm -rf gluon
git clone https://github.com/freifunk-gluon/gluon.git -b $RELEASE
mkdir gluon/site
cp $DIR/modules $DIR/gluon/site/

for SITE in "${SITES[@]}"
  do
    cp $DIR/sites/$SITE/site.* $DIR/gluon/site/
    cp -r $DIR/i18n/ $DIR/gluon/site/
    cd $DIR/gluon/
    make update
    make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=s
    make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=s
    make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=s
    make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=s
    make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=s
    mkdir -p output/images/$SITE
    mv -f output/images/factory output/images/$SITE/
    mv -f output/images/sysupgrade output/images/$SITE/
    rm $DIR/gluon/site/site.*
done

exit
