#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Collimas at 2016-04-20

# Variables ###################################################################
RELEASE="v2016.1.3"
DIR=`pwd`
SITES=(`ls $DIR/sites`)
# SITES=(BO BS LIP) # Used for testing
CORES=8 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

$DIR/mksites.sh

# If gluon directory exists update to latest master and push this into actual repo
if [ -d "$DIR/gluon" ]; then
  cd $DIR/gluon
  cp $DIR/sites/ff/site.* $DIR/gluon/site/
  make update
  git submodule update --remote gluon
fi

# If gluon directory does not exist do a fresh clone frome the Freifunk-Gluon Repo
if [ ! -d "$DIR/gluon" ]; then
  cd $DIR
  git clone https://github.com/freifunk-gluon/gluon.git gluon # -b $RELEASE
  mkdir $DIR/gluon/site
  cp $DIR/sites/ff/site.* $DIR/gluon/site/
  cd $DIR/gluon
  make update
fi

cp $DIR/sign.sh $DIR/gluon/contrib/

if [ ! -d "$DIR/gluon/site" ]; then
  mkdir $DIR/gluon/site
fi

cp $DIR/modules $DIR/gluon/site/

for SITE in "${SITES[@]}"
  do
    cp $DIR/sites/$SITE/site.* $DIR/gluon/site/
    cp -r $DIR/i18n/ $DIR/gluon/site/
    cd $DIR/gluon/
   # This creates images for the stable branch
    time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
    time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
    time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
    make manifest GLUON_BRANCH=stable
    ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
    mkdir -p output/images/$SITE
    mv -f output/images/factory output/images/$SITE/
    mv -f output/images/sysupgrade output/images/$SITE/
    rm $DIR/gluon/site/site.*
    mkdir $DIR/gluon/output/images/logs
    mv $DIR/gluon/make*.log output/images/logs
done

tar -czvf $DIR/gluon/output/buildlog_stable.tar $DIR/gluon/output/images/logs
rm -rf $DIR/gluon/output/images/logs

echo "Finished building Stable branch."

# This creates images for the Experimental branch
# Uncomment if you want to build Experimental images

for SITE in "${SITES[@]}"
  do
    cp $DIR/sites-experimental/$SITE/site.* $DIR/gluon/site/
    cp -r $DIR/i18n/ $DIR/gluon/site/
    cd $DIR/gluon/
    time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
    time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
    time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
    time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
    time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
    mkdir -p output/images-experimental/$SITE
    mv -f output/images/factory output/images-experimental/$SITE/
    mv -f output/images/sysupgrade output/images-experimental/$SITE/
    rm $DIR/gluon/site/site.*
    mkdir $DIR/gluon/output/images-experimental/logs
    mv $DIR/gluon/make*.log output/images-experimental/logs
done

tar -czvf $DIR/gluon/output/buildlog_experimental.tar $DIR/gluon/output/images-experimental/logs
rm -rf $DIR/gluon/output/images-experimental/logs

echo "Finished building Experimental branch."

exit
