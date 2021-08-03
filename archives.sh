#!/bin/bash

# Description: Creates localized firmware archives
# License: GPLv3
# Requirements: /usr/bin/zip

# Variables ##################################################################
IMAGE_PATH="/home/michael/ffowl-fw/firmware/images-stable"
ARCHIVE_PATH="/home/michael/ffowl-fw/firmware/archives"
ERROR_LOG="/home/michael/ffowl-fw/firmware/logs/error.log"
VERSION="1.5.0"
D1=( ffbi )

# Functions ##################################################################
usage()
{
  cat << EOF
  usage: $0 OPTIONS
  Description: Creates localized firmware archives
  
  OPTIONS:
  -h Shows this help
  -I <"String"> Sets the path where to look for the image binaries.
  -A <"String"> Sets the path where to create the Zip-Archives.
  -L <"String"> Sets the path for the error log.
  -v <"String"> Sets version information.
EOF
}

# Main #######################################################################
if [ ! -x /usr/bin/zip ]; then
  echo "\nERROR: Das Paket 'zip' ist nicht installiert.\n"
  exit 1
fi

while getopts .hI:A:L:v:. OPTION
do
  case $OPTION in
    h)
      usage
      exit;;
    I)
      IMAGE_PATH="${OPTARG}"
      ;;
    A)
      ARCHIVE_PATH="${OPTARG}"
      ;;
    L)
      ERROR_LOG="${OPTARG}"
      ;;
    v)
      VERSION="${OPTARG}"
      ;;
    ?)
      usage
      exit;;
  esac
done

if [ ! -d "${ARCHIVE_PATH}" ]; then
  mkdir -p "${ARCHIVE_PATH}"
fi

for town in "${D1[@]}"
  do
    if [ -e "${ARCHIVE_PATH}/all_factory_images_${town}_${VERSION}".zip ]
    then
      /bin/rm "${ARCHIVE_PATH}/all_factory_images_${town}_${VERSION}".zip
    fi
    if [ -e "${ARCHIVE_PATH}/all_sysupgrade_images_${town}_${VERSION}".zip ]
    then
      /bin/rm "${ARCHIVE_PATH}/all_sysupgrade_images_${town}_${VERSION}".zip
    fi

    if [ ${town} = ffbi ]; then

        /usr/bin/zip -j "${ARCHIVE_PATH}/all_factory_images_${town}_${VERSION}".zip "${IMAGE_PATH}"/"${town}"/factory/*.bin > /dev/null 2> "${ERROR_LOG}"
        /usr/bin/zip -j "${ARCHIVE_PATH}/all_sysupgrade_images_${town}_${VERSION}".zip "${IMAGE_PATH}"/"${town}"/sysupgrade/*.bin > /dev/null 2> "${ERROR_LOG}"

    fi

  done

md5sum "${ARCHIVE_PATH}"/* > "${ARCHIVE_PATH}"/pruefsummen.md5
sed -i -r "s/ .*\/(.+)/  \1/g" "${ARCHIVE_PATH}"/pruefsummen.md5
