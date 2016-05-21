#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Tronde at 2016-04-21
# Modified by: Collimas at 2016-05-15

# Voraussetzungen #############################################################
DIR=`pwd`
$DIR/mksites.sh

# Variables ###################################################################
RELEASE="v2016.1.4"
SITES1=(`ls $DIR/sites-d01`)
SITES2=(`ls $DIR/sites-d02`)
SITES3=(`ls $DIR/sites-d03`)
SITES4=(`ls $DIR/sites-d04`)
SITESEX1=(`ls $DIR/sites-d01-experimental`)
SITESEX2=(`ls $DIR/sites-d02-experimental`)
SITESEX3=(`ls $DIR/sites-d03-experimental`)
SITESEX4=(`ls $DIR/sites-d04-experimental`)
#
CORES=3 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

# Functions ###################################################################
build_stable_branch_d01(){
  for SITE in "${SITES1[@]}"
    do
      cp $DIR/sites-d01/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d01/$SITE
      mv -f output/images/factory output/images/d01/$SITE/
      mv -f output/images/sysupgrade output/images/d01/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d01/logs
      mv $DIR/gluon/make*.log output/images/d01/logs
      echo "Finished building Stable branch."
  done
}

build_stable_branch_d02(){
  for SITE in "${SITES2[@]}"
    do
      cp $DIR/sites-d02/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d02/$SITE
      mv -f output/images/factory output/images/d02/$SITE/
      mv -f output/images/sysupgrade output/images/d02/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d02/logs
      mv $DIR/gluon/make*.log output/images/d02/logs
      echo "Finished building Stable branch."
  done
}

build_stable_branch_d03(){
  for SITE in "${SITES3[@]}"
    do
      cp $DIR/sites-d03/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d03/$SITE
      mv -f output/images/factory output/images/d03/$SITE/
      mv -f output/images/sysupgrade output/images/d03/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d03/logs
      mv $DIR/gluon/make*.log output/images/d03/logs
      echo "Finished building Stable branch."
  done
}

build_stable_branch_d04(){
  for SITE in "${SITES4[@]}"
    do
      cp $DIR/sites-d04/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d04/$SITE
      mv -f output/images/factory output/images/d04/$SITE/
      mv -f output/images/sysupgrade output/images/d04/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d04/logs
      mv $DIR/gluon/make*.log output/images/d04/logs
      echo "Finished building Stable branch."
  done
}

build_experimental_branch_d01(){
  for SITE in "${SITESEX1[@]}"
    do
      cp $DIR/sites-d01-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d01/$SITE
      mv -f output/images/factory output/images-experimental/d01/$SITE/
      mv -f output/images/sysupgrade output/images-experimental/d01/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d01/logs
      mv $DIR/gluon/make*.log output/images-experimental/d01/logs
      echo "Finished building Experimental branch."
  done
}

build_experimental_branch_d02(){
  for SITE in "${SITESEX2[@]}"
    do
      cp $DIR/sites-d02-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d02/$SITE
      mv -f output/images/factory output/images-experimental/d02/$SITE/
      mv -f output/images/sysupgrade output/images-experimental/d02/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d02/logs
      mv $DIR/gluon/make*.log output/images-experimental/d02/logs
      echo "Finished building Experimental branch."
  done
}

build_experimental_branch_d03(){
  for SITE in "${SITESEX3[@]}"
    do
      cp $DIR/sites-d03-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d03/$SITE
      mv -f output/images/factory output/images-experimental/d03/$SITE/
      mv -f output/images/sysupgrade output/images-experimental/d03/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d03/logs
      mv $DIR/gluon/make*.log output/images-experimental/d03/logs
      echo "Finished building Experimental branch."
  done
}

build_experimental_branch_d04(){
  for SITE in "${SITESEX4[@]}"
    do
      cp $DIR/sites-d04-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d04/$SITE
      mv -f output/images/factory output/images-experimental/d04/$SITE/
      mv -f output/images/sysupgrade output/images-experimental/d04/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d04/logs
      mv $DIR/gluon/make*.log output/images-experimental/d04/logs
      echo "Finished building Experimental branch."
  done
}

create_logs_stable_d01(){
  tar -czvf $DIR/gluon/output/buildlog_d01_stable.tar $DIR/gluon/output/images/d01/logs
  rm -rf $DIR/gluon/output/images/d01/logs
}
create_logs_stable_d02(){
  tar -czvf $DIR/gluon/output/buildlog_d02_stable.tar $DIR/gluon/output/images/d02/logs
  rm -rf $DIR/gluon/output/images/d02/logs
}
create_logs_stable_d03(){
  tar -czvf $DIR/gluon/output/buildlog_d03_stable.tar $DIR/gluon/output/images/d03/logs
  rm -rf $DIR/gluon/output/images/d03/logs
}
create_logs_stable_d04(){
  tar -czvf $DIR/gluon/output/buildlog_d04_stable.tar $DIR/gluon/output/images/d04/logs
  rm -rf $DIR/gluon/output/images/d04/logs
}

create_logs_experimental_d01(){
  tar -czvf $DIR/gluon/output/buildlog_d01_experimental.tar $DIR/gluon/output/images-experimental/d01/logs
  rm -rf $DIR/gluon/output/images-experimental/d01/logs
}

create_logs_experimental_d02(){
  tar -czvf $DIR/gluon/output/buildlog_d02_experimental.tar $DIR/gluon/output/images-experimental/d02/logs
  rm -rf $DIR/gluon/output/images-experimental/d02/logs
}

create_logs_experimental_d03(){
  tar -czvf $DIR/gluon/output/buildlog_d03_experimental.tar $DIR/gluon/output/images-experimental/d03/logs
  rm -rf $DIR/gluon/output/images-experimental/d03/logs
}

create_logs_experimental_d04(){
  tar -czvf $DIR/gluon/output/buildlog_d04_experimental.tar $DIR/gluon/output/images-experimental/d04/logs
  rm -rf $DIR/gluon/output/images-experimental/d04/logs
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
    git clone https://github.com/freifunk-gluon/gluon.git gluon # -b $RELEASE
    mkdir -p $DIR/gluon/site
    cp $DIR/sites-d01/ff/site.* $DIR/gluon/site/
    cd $DIR/gluon
    make update
fi

cp $DIR/sign.sh $DIR/gluon/contrib/
cp $DIR/modules $DIR/gluon/site/
build_stable_branch_d01
create_logs_stable_d01
build_stable_branch_d02
create_logs_stable_d02
build_stable_branch_d03
create_logs_stable_d03
build_stable_branch_d04
create_logs_stable_d04

# This creates images for the Experimental branch
# Uncomment if you want to build Experimental images
#build_experimental_branch_d01
#create_logs_experimental_d01
#build_experimental_branch_d02
#create_logs_experimental_d02
#build_experimental_branch_d03
#create_logs_experimental_d03
#build_experimental_branch_d04
#create_logs_experimental_d04

exit
