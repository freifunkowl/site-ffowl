#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Tronde at 2016-04-21
# Modified by: Collimas at 2016-04-21

# Voraussetzungen #############################################################
DIR=`pwd`
$DIR/mksites.sh

# Variables ###################################################################
RELEASE="v2016.1.4"
SITES=(`ls $DIR/sites`)
#SITES=(BS LIP) # Used for testing
CORES=3 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

# Functions ###################################################################
build_stable_branch(){
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
      mkdir -p $DIR/gluon/output/images/logs
      mv $DIR/gluon/make*.log output/images/logs
      echo "Finished building Stable branch."
  done
}

build_experimental_branch(){
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
      mkdir -p $DIR/gluon/output/images-experimental/logs
      mv $DIR/gluon/make*.log output/images-experimental/logs
      echo "Finished building Experimental branch."
  done
}

create_logs_stable(){
  tar -czvf $DIR/gluon/output/buildlog_stable.tar $DIR/gluon/output/images/logs
  rm -rf $DIR/gluon/output/images/logs
}

create_logs_experimental(){

  tar -czvf $DIR/gluon/output/buildlog_experimental.tar $DIR/gluon/output/images-experimental/logs
  rm -rf $DIR/gluon/output/images-experimental/logs
}


# If gluon directory exists update to latest master and push this into actual repo
if [ -d "$DIR/gluon" ]
  then
    cd $DIR/gluon
      if [ ! -d "$DIR/gluon/site" ]; then
        mkdir -p $DIR/gluon/site
      fi
    cp $DIR/sites/ff/site.* $DIR/gluon/site/
    make update
    git pull
    git submodule update --remote gluon
  else
    # If gluon directory does not exist do a fresh clone frome the Freifunk-Gluon Repo
    cd $DIR
    git clone https://github.com/freifunk-gluon/gluon.git gluon -b $RELEASE
    mkdir -p $DIR/gluon/site
    cp $DIR/sites/ff/site.* $DIR/gluon/site/
    cd $DIR/gluon
    make update
fi

cp $DIR/sign.sh $DIR/gluon/contrib/
cp $DIR/modules $DIR/gluon/site/
build_stable_branch
create_logs_stable

# This creates images for the Experimental branch
# Uncomment if you want to build Experimental images
#build_experimental_branch
#create_logs_experimental

exit
