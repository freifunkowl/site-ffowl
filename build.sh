#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Tronde at 2016-04-21
# Modified by: Collimas at 2018-07-10

# Voraussetzungen #############################################################
DIR=`pwd`
$DIR/mksites.sh

# Variables ###################################################################
RELEASE="v2020.1.3"
SITES=(`ls $DIR/sites-stable`)
SITESEXT=(`ls $DIR/sites-stable-ext`)
#
CORES=12 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

# Functions ###################################################################

build_stable_branch(){

rm -rf $DIR/domains
mkdir $DIR/domains
cp $DIR/domains-templates/d*.conf $DIR/domains

  for SITE in "${SITES[@]}"
    do
      cp -r $DIR/sites-stable/$SITE/*.* $DIR/gluon/site/
      cd $DIR/gluon/
      make update
      # This creates images for the stable branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-tiny V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ath79-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-mikrotik V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ramips-mt7620 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ramips-mt7621 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ramips-mt76x8 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ramips-rt305x V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ipq806x-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ipq40xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mvebu-cortexa9 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      cp -r $DIR/sites-stable-ext/$SITE/*.* $DIR/gluon/site/
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2710 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=sunxi-cortexa7 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-geode V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest BROKEN=1 GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images-stable/$SITE
      mv -f output/images/factory output/images-stable/$SITE/
      md5sum output/images-stable/$SITE/factory/* > output/images-stable/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-stable/$SITE/factory/pruefsummen.md5 
      mv -f output/images/sysupgrade output/images-stable/$SITE/
      md5sum output/images-stable/$SITE/sysupgrade/* > output/images-stable/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-stable/$SITE/sysupgrade/pruefsummen.md5
      mv -f output/images/other output/images-stable
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-stable/logs
      mv $DIR/gluon/make*.log output/images-stable/logs
      echo "Finished building Stable branch."
  done
}

build_stable_ext_branch(){

rm -rf $DIR/domains
mkdir $DIR/domains
cp $DIR/domains-templates/d*.conf $DIR/domains

  for SITE in "${SITESEXT[@]}"
    do
      cp -r $DIR/sites-stable-ext/$SITE/*.* $DIR/gluon/site/
      cd $DIR/gluon/
      make update
      # This creates images for the stable_ext branch
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2710 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=sunxi-cortexa7 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-geode V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      make manifest BROKEN=1 GLUON_BRANCH=stable
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest   
      mkdir -p output/images-stable-ext/$SITE
      mv -f output/images/factory output/images-stable-ext/$SITE/
      md5sum output/images-stable-ext/$SITE/factory/* > output/images-stable-ext/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-stable-ext/$SITE/factory/pruefsummen.md5 
      mv -f output/images/sysupgrade output/images-stable-ext/$SITE/
      md5sum output/images-stable-ext/$SITE/sysupgrade/* > output/images-stable-ext/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-stable-ext/$SITE/sysupgrade/pruefsummen.md5
      rm $DIR/gluon/site/site.*
      rm -rf output/images
      mkdir -p $DIR/gluon/output/images-stable-ext/logs
      mv $DIR/gluon/make*.log output/images-stable-ext/logs
      echo "Finished building Stable Extended branch."
  done
}

create_logs_stable(){
  tar -czvf $DIR/gluon/output/buildlog_stable.tar $DIR/gluon/output/images-stable/logs
  rm -rf $DIR/gluon/output/images-stable/logs
}

create_logs_stable_ext(){
  tar -czvf $DIR/gluon/output/buildlog_stable_ext.tar $DIR/gluon/output/images-stable-ext/logs
  rm -rf $DIR/gluon/output/images-stable-ext/logs
}

# If gluon directory exists update to latest master and push this into actual repo
if [ -d "$DIR/gluon" ]
  then
    cd $DIR/gluon
      if [ ! -d "$DIR/gluon/site" ]; then
        mkdir -p $DIR/gluon/site
      fi
    cp $DIR/sites-stable/lip/site.* $DIR/gluon/site/
    #make dirclean
    #make update
    git pull
    git submodule update --remote gluon
  else
    # If gluon directory does not exist do a fresh clone frome the Freifunk-Gluon Repo
    cd $DIR
    # Checkout regular source
    git clone https://github.com/freifunk-gluon/gluon.git gluon -b $RELEASE
    git remote add gluon https://github.com/freifunk-gluon/gluon.git
    mkdir -p $DIR/gluon/site
    cp $DIR/sites-stable/lip/site.* $DIR/gluon/site/
    cd $DIR/gluon
    #git pull
    git submodule update #--remote gluon
    #make update
fi

cp $DIR/sign.sh $DIR/gluon/contrib/
cp $DIR/modules $DIR/gluon/site/
cp -r $DIR/i18n/ $DIR/gluon/site/
cp -r $DIR/domains/ $DIR/gluon/site/

# This creates the stable branch
build_stable_branch
create_logs_stable
#build_stable_ext_branch
#create_logs_stable_ext

exit
