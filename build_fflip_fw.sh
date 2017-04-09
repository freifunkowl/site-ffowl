#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Tronde at 2016-04-21
# Modified by: Collimas at 2017-03-24

# Voraussetzungen #############################################################
DIR=`pwd`
$DIR/mksites.sh

# Variables ###################################################################
RELEASE="v2016.2.4"
SITES1=(`ls $DIR/sites-d1`)
SITES2=(`ls $DIR/sites-d2`)
SITES3=(`ls $DIR/sites-d3`)
SITES4=(`ls $DIR/sites-d4`)
SITES5=(`ls $DIR/sites-d5`)
SITES6=(`ls $DIR/sites-d6`)
SITESEX1=(`ls $DIR/sites-d1-experimental`)
SITESEX2=(`ls $DIR/sites-d2-experimental`)
SITESEX3=(`ls $DIR/sites-d3-experimental`)
SITESEX4=(`ls $DIR/sites-d4-experimental`)
SITESEX5=(`ls $DIR/sites-d5-experimental`)
SITESEX6=(`ls $DIR/sites-d6-experimental`)
#
CORES=16 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

# Functions ###################################################################
build_stable_branch_d1(){
  for SITE in "${SITES1[@]}"
    do
      cp $DIR/sites-d1/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-tiny V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d1/$SITE
      mv -f output/images/factory output/images/d1/$SITE/
      md5sum output/images/d1/$SITE/factory/* > output/images/d1/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d1/$SITE/factory/pruefsummen.md5 
      mv -f output/images/sysupgrade output/images/d1/$SITE/
      md5sum output/images/d1/$SITE/sysupgrade/* > output/images/d1/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d1/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d1/logs
      mv $DIR/gluon/make*.log output/images/d1/logs
      echo "Finished building Stable branch."
  done
}

build_stable_branch_d2(){
  for SITE in "${SITES2[@]}"
    do
      cp $DIR/sites-d2/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-tiny V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d2/$SITE
      mv -f output/images/factory output/images/d2/$SITE/
      md5sum output/images/d2/$SITE/factory/* > output/images/d2/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d2/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images/d2/$SITE/
      md5sum output/images/d2/$SITE/sysupgrade/* > output/images/d2/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d2/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d2/logs
      mv $DIR/gluon/make*.log output/images/d2/logs
      echo "Finished building Stable branch."
  done
}

build_stable_branch_d3(){
  for SITE in "${SITES3[@]}"
    do
      cp $DIR/sites-d3/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-tiny V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d3/$SITE
      mv -f output/images/factory output/images/d3/$SITE/
      md5sum output/images/d3/$SITE/factory/* > output/images/d3/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d3/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images/d3/$SITE/
      md5sum output/images/d3/$SITE/sysupgrade/* > output/images/d3/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d3/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d3/logs
      mv $DIR/gluon/make*.log output/images/d3/logs
      echo "Finished building Stable branch."
  done
}

build_stable_branch_d4(){
  for SITE in "${SITES4[@]}"
    do
      cp $DIR/sites-d4/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-tiny V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d4/$SITE
      mv -f output/images/factory output/images/d4/$SITE/
      md5sum output/images/d4/$SITE/factory/* > output/images/d4/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d4/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images/d4/$SITE/
      md5sum output/images/d4/$SITE/sysupgrade/* > output/images/d4/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d4/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d4/logs
      mv $DIR/gluon/make*.log output/images/d4/logs
      echo "Finished building Stable branch."
  done
}

build_stable_branch_d5(){
  for SITE in "${SITES5[@]}"
    do
      cp $DIR/sites-d5/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-tiny V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d5/$SITE
      mv -f output/images/factory output/images/d5/$SITE/
      md5sum output/images/d5/$SITE/factory/* > output/images/d5/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d5/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images/d5/$SITE/
      md5sum output/images/d5/$SITE/sysupgrade/* > output/images/d5/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d5/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d5/logs
      mv $DIR/gluon/make*.log output/images/d5/logs
      echo "Finished building Stable branch."
  done
}

build_stable_branch_d6(){
  for SITE in "${SITES6[@]}"
    do
      cp $DIR/sites-d6/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-tiny V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images/d6/$SITE
      mv -f output/images/factory output/images/d6/$SITE/
      md5sum output/images/d6/$SITE/factory/* > output/images/d6/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d6/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images/d6/$SITE/
      md5sum output/images/d6/$SITE/sysupgrade/* > output/images/d6/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images/d6/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images/d6/logs
      mv $DIR/gluon/make*.log output/images/d6/logs
      echo "Finished building Stable branch."
  done
}

build_experimental_branch_d1(){
  for SITE in "${SITESEX1[@]}"
    do
      cp $DIR/sites-d1-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d1/$SITE
      mv -f output/images/factory output/images-experimental/d1/$SITE/
      md5sum output/images-experimental/d1/$SITE/factory/* > output/images-experimental/d1/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d1/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images-experimental/d1/$SITE/
      md5sum output/images-experimental/d1/$SITE/sysupgrade/* > output/images-experimental/d1/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d1/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d1/logs
      mv $DIR/gluon/make*.log output/images-experimental/d1/logs
      echo "Finished building Experimental branch."
  done
}

build_experimental_branch_d2(){
  for SITE in "${SITESEX2[@]}"
    do
      cp $DIR/sites-d2-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d2/$SITE
      mv -f output/images/factory output/images-experimental/d2/$SITE/
      md5sum output/images-experimental/d2/$SITE/factory/* > output/images-experimental/d2/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d2/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images-experimental/d2/$SITE/
      md5sum output/images-experimental/d2/$SITE/sysupgrade/* > output/images-experimental/d2/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d2/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d2/logs
      mv $DIR/gluon/make*.log output/images-experimental/d2/logs
      echo "Finished building Experimental branch."
  done
}

build_experimental_branch_d3(){
  for SITE in "${SITESEX3[@]}"
    do
      cp $DIR/sites-d3-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d3/$SITE
      mv -f output/images/factory output/images-experimental/d3/$SITE/
      md5sum output/images-experimental/d3/$SITE/factory/* > output/images-experimental/d3/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d3/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images-experimental/d3/$SITE/
      md5sum output/images-experimental/d3/$SITE/sysupgrade/* > output/images-experimental/d3/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d3/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d3/logs
      mv $DIR/gluon/make*.log output/images-experimental/d3/logs
      echo "Finished building Experimental branch."
  done
}

build_experimental_branch_d4(){
  for SITE in "${SITESEX4[@]}"
    do
      cp $DIR/sites-d4-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d4/$SITE
      mv -f output/images/factory output/images-experimental/d4/$SITE/
      md5sum output/images-experimental/d4/$SITE/factory/* > output/images-experimental/d4/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d4/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images-experimental/d4/$SITE/
      md5sum output/images-experimental/d4/$SITE/sysupgrade/* > output/images-experimental/d4/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d4/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d4/logs
      mv $DIR/gluon/make*.log output/images-experimental/d4/logs
      echo "Finished building Experimental branch."
  done
}

build_experimental_branch_d5(){
  for SITE in "${SITESEX5[@]}"
    do
      cp $DIR/sites-d5-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d5/$SITE
      mv -f output/images/factory output/images-experimental/d5/$SITE/
      md5sum output/images-experimental/d5/$SITE/factory/* > output/images-experimental/d5/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d5/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images-experimental/d5/$SITE/
      md5sum output/images-experimental/d5/$SITE/sysupgrade/* > output/images-experimental/d5/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d5/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d5/logs
      mv $DIR/gluon/make*.log output/images-experimental/d5/logs
      echo "Finished building Experimental branch."
  done
}

build_experimental_branch_d6(){
  for SITE in "${SITESEX6[@]}"
    do
      cp $DIR/sites-d6-experimental/$SITE/site.* $DIR/gluon/site/
      cp -r $DIR/i18n/ $DIR/gluon/site/
      cd $DIR/gluon/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=sunxi V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=experimental GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      mkdir -p output/images-experimental/d6/$SITE
      mv -f output/images/factory output/images-experimental/d6/$SITE/
      md5sum output/images-experimental/d6/$SITE/factory/* > output/images-experimental/d6/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d6/$SITE/factory/pruefsummen.md5
      mv -f output/images/sysupgrade output/images-experimental/d6/$SITE/
      md5sum output/images-experimental/d6/$SITE/sysupgrade/* > output/images-experimental/d6/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-experimental/d6/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-experimental/d6/logs
      mv $DIR/gluon/make*.log output/images-experimental/d6/logs
      echo "Finished building Experimental branch."
  done
}

create_logs_stable_d1(){
  tar -czvf $DIR/gluon/output/buildlog_d1_stable.tar $DIR/gluon/output/images/d1/logs
  rm -rf $DIR/gluon/output/images/d1/logs
}
create_logs_stable_d2(){
  tar -czvf $DIR/gluon/output/buildlog_d2_stable.tar $DIR/gluon/output/images/d2/logs
  rm -rf $DIR/gluon/output/images/d2/logs
}
create_logs_stable_d3(){
  tar -czvf $DIR/gluon/output/buildlog_d3_stable.tar $DIR/gluon/output/images/d3/logs
  rm -rf $DIR/gluon/output/images/d3/logs
}
create_logs_stable_d4(){
  tar -czvf $DIR/gluon/output/buildlog_d4_stable.tar $DIR/gluon/output/images/d4/logs
  rm -rf $DIR/gluon/output/images/d4/logs
}
create_logs_stable_d5(){
  tar -czvf $DIR/gluon/output/buildlog_d5_stable.tar $DIR/gluon/output/images/d5/logs
  rm -rf $DIR/gluon/output/images/d5/logs
}
create_logs_stable_d6(){
  tar -czvf $DIR/gluon/output/buildlog_d6_stable.tar $DIR/gluon/output/images/d6/logs
  rm -rf $DIR/gluon/output/images/d6/logs
}

create_logs_experimental_d1(){
  tar -czvf $DIR/gluon/output/buildlog_d1_experimental.tar $DIR/gluon/output/images-experimental/d1/logs
  rm -rf $DIR/gluon/output/images-experimental/d1/logs
}

create_logs_experimental_d2(){
  tar -czvf $DIR/gluon/output/buildlog_d2_experimental.tar $DIR/gluon/output/images-experimental/d2/logs
  rm -rf $DIR/gluon/output/images-experimental/d2/logs
}

create_logs_experimental_d3(){
  tar -czvf $DIR/gluon/output/buildlog_d3_experimental.tar $DIR/gluon/output/images-experimental/d3/logs
  rm -rf $DIR/gluon/output/images-experimental/d3/logs
}

create_logs_experimental_d4(){
  tar -czvf $DIR/gluon/output/buildlog_d4_experimental.tar $DIR/gluon/output/images-experimental/d4/logs
  rm -rf $DIR/gluon/output/images-experimental/d4/logs
}

create_logs_experimental_d5(){
  tar -czvf $DIR/gluon/output/buildlog_d5_experimental.tar $DIR/gluon/output/images-experimental/d5/logs
  rm -rf $DIR/gluon/output/images-experimental/d5/logs
}

create_logs_experimental_d6(){
  tar -czvf $DIR/gluon/output/buildlog_d6_experimental.tar $DIR/gluon/output/images-experimental/d6/logs
  rm -rf $DIR/gluon/output/images-experimental/d6/logs
}

# If gluon directory exists update to latest master and push this into actual repo
if [ -d "$DIR/gluon" ]
  then
    cd $DIR/gluon
      if [ ! -d "$DIR/gluon/site" ]; then
        mkdir -p $DIR/gluon/site
      fi
    cp $DIR/sites-d1/ff/site.* $DIR/gluon/site/
    make update
    git pull
    git submodule update --remote gluon
  else
    # If gluon directory does not exist do a fresh clone frome the Freifunk-Gluon Repo
    cd $DIR
    git clone https://github.com/freifunk-gluon/gluon.git gluon # -b $RELEASE
    git remote add gluon https://github.com/freifunk-gluon/gluon.git
    mkdir -p $DIR/gluon/site
    cp $DIR/sites-d1/ff/site.* $DIR/gluon/site/
    cd $DIR/gluon
    make update
    git pull
    git submodule update --remote gluon
#read -p "Press enter to continue"
fi

cp $DIR/sign.sh $DIR/gluon/contrib/
cp $DIR/modules $DIR/gluon/site/
build_stable_branch_d1
create_logs_stable_d1
build_stable_branch_d2
create_logs_stable_d2
build_stable_branch_d3
create_logs_stable_d3
build_stable_branch_d4
create_logs_stable_d4
build_stable_branch_d5
create_logs_stable_d5
build_stable_branch_d6
create_logs_stable_d6

# This creates images for the Experimental branch
# Uncomment if you want to build Experimental images
build_experimental_branch_d1
create_logs_experimental_d1
build_experimental_branch_d2
create_logs_experimental_d2
build_experimental_branch_d3
create_logs_experimental_d3
build_experimental_branch_d4
create_logs_experimental_d4
build_experimental_branch_d5
create_logs_experimental_d5
build_experimental_branch_d6
create_logs_experimental_d6

exit
