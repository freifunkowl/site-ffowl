#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
#
# Created by: Collimas
# Modified by: Tronde at 2015-10-31
# Modified by: Tronde at 2016-04-21
# Modified by: Collimas at 2021-07-31

# Voraussetzungen #############################################################
DIR=`pwd`
rm /tmp/buildstate
touch /tmp/buildstate
mkdir -p $DIR/sites-stable/ffbi
cp $DIR/site.conf.ffbi.stable.example $DIR/sites-stable/ffbi/
cp $DIR/site.mk.ffbi.stable.example $DIR/sites-stable/ffbi/

# Variables ###################################################################
BRANCH="v2021.1.x"
RELEASE="v2021.1"
SITES=(`ls $DIR/sites-stable`)
#
CORES=12 # Specifies the number of jobs (commands) to run simultaneously.
SECRET=$DIR/secret
###############################################################################

# Functions ###################################################################

build_stable_branch(){

  for SITE in "${SITES[@]}"
    do
      rm $DIR/gluon/site/site.*
      rm -rf $DIR/gluon/site/domains/
      mkdir -p $DIR/gluon/site/domains/
      cp $DIR/sites-stable/$SITE/site.conf.$SITE.stable.example $DIR/gluon/site/site.conf
      cp $DIR/sites-stable/$SITE/site.mk.$SITE.stable.example $DIR/gluon/site/site.mk
      cp $DIR/domains-templates/$SITE/*.conf $DIR/gluon/site/domains/
      cd $DIR/gluon/
      make update
      # This creates images for the stable branch
      echo >>/tmp/buildstate 'Compiling firmware...'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-tiny V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '01 of 24 targets finished in' $((after - $before)) 'seconds [ar71xx-tiny]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '02 of 24 targets finished in' $((after - $before)) 'seconds [ar71xx-generic]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-nand V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '03 of 24 targets finished in' $((after - $before)) 'seconds [ar71xx-nand]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ar71xx-mikrotik V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '04 of 24 targets finished in' $((after - $before)) 'seconds [ar71xx-mikrotik]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ath79-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '05 of 24 targets finished in' $((after - $before)) 'seconds [ath79-generic]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '06 of 24 targets finished in' $((after - $before)) 'seconds [mpc85xx-generic]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mpc85xx-p1020 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '07 of 24 targets finished in' $((after - $before)) 'seconds [mpc85xx-p1020]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ramips-mt7620 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '08 of 24 targets finished in' $((after - $before)) 'seconds [ramips-mt7620]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ramips-mt7621 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '09 of 24 targets finished in' $((after - $before)) 'seconds [ramips-mt7621]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ramips-mt76x8 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '10 of 24 targets finished in' $((after - $before)) 'seconds [ramips-mt76x8]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ramips-rt305x V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '11 of 24 targets finished in' $((after - $before)) 'seconds [ramips-rt305x]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ipq806x-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '12 of 24 targets finished in' $((after - $before)) 'seconds [ipq806x-generic]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=ipq40xx-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '13 of 24 targets finished in' $((after - $before)) 'seconds [ipq40xx-generic]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=mvebu-cortexa9 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log      
      after=$(date +%s)
      echo >>/tmp/buildstate '14 of 24 targets finished in' $((after - $before)) 'seconds [mvebu-cortexa9]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2708 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '15 of 24 targets finished in' $((after - $before)) 'seconds [brcm2708-bcm2708]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2709 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '16 of 24 targets finished in' $((after - $before)) 'seconds [brcm2708-bcm2709]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=brcm2708-bcm2710 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '17 of 24 targets finished in' $((after - $before)) 'seconds [brcm2708-bcm2710]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=sunxi-cortexa7 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '18 of 24 targets finished in' $((after - $before)) 'seconds [sunxi-cortexa7]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=lantiq-xrx200 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '19 of 24 targets finished in' $((after - $before)) 'seconds [lantiq-xrx200]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=lantiq-xway V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '20 of 24 targets finished in' $((after - $before)) 'seconds [lantiq-xway]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-64 V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '21 of 24 targets finished in' $((after - $before)) 'seconds [x86-64]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-generic V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '22 of 24 targets finished in' $((after - $before)) 'seconds [x86-generic]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-geode V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '23 of 24 targets finished in' $((after - $before)) 'seconds [x86-geode]'

      before=$(date +%s)
      time make -j$CORES BROKEN=1 GLUON_BRANCH=stable GLUON_TARGET=x86-legacy V=99 2>&1 | tee make_$SITE_$(date +%y%m%d_%H%M).log
      after=$(date +%s)
      echo >>/tmp/buildstate '24 of 24 targets finished in' $((after - $before)) 'seconds [x86-legacy]'

      make manifest BROKEN=1 GLUON_BRANCH=stable
      echo >>/tmp/buildstate 'Manifest created.'
      ./contrib/sign.sh $SECRET output/images/sysupgrade/stable.manifest
      echo >>/tmp/buildstate 'Signed.'
      mkdir -p output/images-stable/$SITE
      mv -f output/images/factory output/images-stable/$SITE/
      md5sum output/images-stable/$SITE/factory/* > output/images-stable/$SITE/factory/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-stable/$SITE/factory/pruefsummen.md5 
      mv -f output/images/sysupgrade output/images-stable/$SITE/
      md5sum output/images-stable/$SITE/sysupgrade/* > output/images-stable/$SITE/sysupgrade/pruefsummen.md5
      sed -i -r "s/ .*\/(.+)/  \1/g" output/images-stable/$SITE/sysupgrade/pruefsummen.md5
      mv -f output/images/other output/images-stable/$SITE/
      rm $DIR/gluon/site/site.*
      mkdir -p $DIR/gluon/output/images-stable/logs
      mv $DIR/gluon/make*.log output/images-stable/logs
      echo >>/tmp/buildstate 'Finished building Stable branch: '$SITE
  done
}

create_logs_stable(){
  tar -czvf $DIR/gluon/output/buildlog_stable.tar $DIR/gluon/output/images-stable/logs
  rm -rf $DIR/gluon/output/images-stable/logs
}

# If gluon directory exists update to latest master and push this into actual repo
if [ -d "$DIR/gluon" ]
  then
    cd $DIR/gluon
      if [ ! -d "$DIR/gluon/site" ]; then
        mkdir -p $DIR/gluon/site
      fi
    cp $DIR/sites-stable/lip/site.* $DIR/gluon/site/
    make update
  else
    # If gluon directory does not exist do a fresh clone frome the Freifunk-Gluon Repo
    cd $DIR
    # Checkout regular source
    git clone https://github.com/freifunk-gluon/gluon.git gluon -b $BRANCH
    cd $DIR/gluon
    git checkout $RELEASE
    mkdir -p $DIR/gluon/site
    cp $DIR/sites-stable/lip/site.* $DIR/gluon/site/
    make update
fi

cp $DIR/sign.sh $DIR/gluon/contrib/
cp $DIR/modules $DIR/gluon/site/
cp -r $DIR/i18n/ $DIR/gluon/site/

# This creates the stable branch
build_stable_branch
create_logs_stable

exit
