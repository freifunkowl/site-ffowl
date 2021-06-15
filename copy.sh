#! /bin/bash

# Script for executing post-building firmware tasks
#
# Created by: Collimas

#-variables

SITES=(`ls sites-stable`)

#-functions

cleanup(){
  rm -rf /home/michael/fflip-fw/firmware
}

createdir(){
  mkdir -p /home/michael/fflip-fw/firmware/logs
}

copy_stable_branch_to_workdir(){
  mkdir -p /home/michael/fflip-fw/firmware/images-stable/$SITE
  cp -r /home/michael/fflip-fw/gluon/output/images-stable/ /home/michael/fflip-fw/firmware/
}

create_upload_dir(){
  mkdir -p /home/michael/fflip-fw/firmware/upload/stable
}

copy_sysupgrade_images_stable(){
  for SITE in "${SITES[@]}"
    do
      mkdir -p /home/michael/fflip-fw/firmware/upload/stable/$SITE/upgrade
      cp /home/michael/fflip-fw/firmware/images-stable/$SITE/sysupgrade/* /home/michael/fflip-fw/firmware/upload/stable/$SITE/upgrade
      rm /home/michael/fflip-fw/firmware/upload/stable/$SITE/upgrade/*.md5
      mkdir /home/michael/fflip-fw/firmware/images-stable/$SITE/md5-factory
      mkdir /home/michael/fflip-fw/firmware/images-stable/$SITE/md5-sysupgrade
      mv /home/michael/fflip-fw/firmware/images-stable/$SITE/factory/*.md5 /home/michael/fflip-fw/firmware/images-stable/$SITE/md5-factory
      mv /home/michael/fflip-fw/firmware/images-stable/$SITE/sysupgrade/*.md5 /home/michael/fflip-fw/firmware/images-stable/$SITE/md5-sysupgrade
      rm /home/michael/fflip-fw/firmware/images-stable/$SITE/sysupgrade/*.manifest
  done
}

copy_myupgrade_images(){

mkdir -p /home/michael/fflip-fw/firmware/myupgrade
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-tl-wr841n-nd-v9-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/wr841v9.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-tl-wr841n-nd-v11-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/wr841v11.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-tl-wr1043n-nd-v2-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/wr1043v2.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-tl-wr1043n-nd-v4-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/wr1043v4.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-tl-wr1043n-v5-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/wr1043v5.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-tl-wdr3600-v1-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/wdr3600v1.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-tl-wdr4300-v1-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/wdr4300v1.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-archer-c7-v2-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/archerc7v2.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-ubnt-erx-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/ubnterx.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-ubiquiti-unifi-ac-mesh-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/unifiacmesh.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-ubiquiti-unifi-ac-lite-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/unifiaclite.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-archer-c50-v3-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/archerc50v3.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-tp-link-archer-c50-v4-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/archerc50v4.bin
cp /home/michael/fflip-fw/firmware/images-stable/lip/sysupgrade/gluon-fflip-??????????????-netgear-r6120-sysupgrade.bin /home/michael/fflip-fw/firmware/myupgrade/r6120.bin


}

#-main

cleanup
createdir
copy_stable_branch_to_workdir
create_upload_dir
copy_sysupgrade_images_stable
copy_myupgrade_images

exit