#!/bin/bash

# Description: Creates localized firmware archives
# License: GPLv3
# Requirements: /usr/bin/zip

# Variables ##################################################################
IMAGE_PATH="/var/www/jkastning/sites/firmware.freifunk-lippe.de/public/images"
ARCHIVE_PATH="/var/www/jkastning/sites/firmware.freifunk-lippe.de/public/Archives"
VERSION="0.8.14"
D1=( ex ff lip )
D2=( ad dt hb la )
D3=( kt le )
D4=( bs lh oe sc )

# Main #######################################################################
if [ ! -x /usr/bin/zip ]; then
  echo "\nERROR: Das Paket 'zip' ist nicht installiert.\n"
  exit 1
fi

for town in "${D1[@]}"
  do
    if [ -e "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip ]
    then
      /bin/rm "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip
    fi
    /usr/bin/zip "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip "${IMAGE_PATH}"/d1/"${town}"/factory/*.bin > /dev/null 2> ~/fflip-fw/fehler.txt
done

for town in "${D2[@]}"
  do
    if [ -e "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip ]
    then
      /bin/rm "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip
    fi
    /usr/bin/zip "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip "${IMAGE_PATH}"/d2/"${town}"/factory/*.bin > /dev/null 2> ~/fflip-fw/fehler.txt
done

for town in "${D3[@]}"
  do
    if [ -e "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip ]
    then
      /bin/rm "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip
    fi
    /usr/bin/zip "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip "${IMAGE_PATH}"/d3/"${town}"/factory/*.bin > /dev/null 2> ~/fflip-fw/fehler.txt
done

for town in "${D4[@]}"
  do
    if [ -e "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip ]
    then
      /bin/rm "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip
    fi
    /usr/bin/zip "${ARCHIVE_PATH}/All_factory_images_for_${town}_${VERSION}".zip "${IMAGE_PATH}"/d4/"${town}"/factory/*.bin > /dev/null 2> ~/fflip-fw/fehler.txt
done
