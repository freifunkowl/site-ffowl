#! /bin/bash

# Build script for firmware compiling Freifunk Lippe
# 
# The files site.conf and site.mk must exist in separate folders in /home/user like this:
# /home/user/SITES/LIP - /home/user/SITES/LE and so on...
# Your secret file also has to be in /home/user

cd /home/$USER
# BO - BAD OEYNHAUSEN
git clone https://github.com/freifunk-gluon/gluon.git gluon -b v2015.1.2
cp /home/$USER/secret /home/$USER/gluon/
mkdir /home/$USER/gluon/site
cp /home/$USER/SITES/BO/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/BO/site.mk /home/$USER/gluon/site
cd gluon
git pull origin v2015.1.2
make update
make clean GLUON_TARGET=ar71xx-generic
make clean GLUON_TARGET=ar71xx-nand
make clean GLUON_TARGET=mpc85xx-generic
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/BO
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/BO/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/BO/

# BS - BAD SALZUFLEN
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/BS/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/BS/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/BS
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/BS/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/BS/

# DT - DETMOLD
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/DT/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/DT/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/DT
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/DT/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/DT/

# HB - HORN- BAD MEINBERG
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/HB/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/HB/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/HB
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/HB/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/HB/

# LA - LAGE
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/LA/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/LA/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/LA
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/LA/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/LA/

# LE - LEMGO
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/LE/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/LE/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/LE
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/LE/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/LE/

# LH - LEOPOLDSHOEHE
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/LH/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/LH/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/LH
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/LH/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/LH/

# LIP - LIPPE
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/LIP/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/LIP/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/LIP
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/LIP/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/LIP/

# SC - SCHOETMAR
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/SC/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/SC/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/SC
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/SC/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/SC/

# TS - TEST
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/TS/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/TS/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/TS
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/TS/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/TS/

# FF - FREIFUNK
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/FF/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/FF/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/FF
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/FF/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/FF/

# KT - KALLETAL
rm /home/$USER/gluon/site/site.conf
rm /home/$USER/gluon/site/site.mk
cp /home/$USER/SITES/KT/site.conf /home/$USER/gluon/site
cp /home/$USER/SITES/KT/site.mk /home/$USER/gluon/site
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-generic V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=ar71xx-nand V=s
make -j6 GLUON_BRANCH=experimental GLUON_TARGET=mpc85xx-generic V=s
make manifest GLUON_BRANCH=experimental
make manifest GLUON_BRANCH=stable
./contrib/sign.sh secret images/sysupgrade/experimental.manifest
./contrib/sign.sh secret images/sysupgrade/stable.manifest
mkdir /home/$USER/gluon/images/KT
mv /home/$USER/gluon/images/factory /home/$USER/gluon/images/KT/
mv /home/$USER/gluon/images/sysupgrade /home/$USER/gluon/images/KT/
