#!/bin/bash
###############################################################################
# Autor: Tronde (tronde(at)my-it-brain(dot)de)
# Modified by: Collimas 2016-04-20
# Datum: 2015-11-11
# Lizenz: GPLv3
#
# Beschreibung:
# Dieses Skript erstellt die Dateien site.conf und site.mk fuer die einzelnen
# Freifunk-Communities von Freifunk-Lippe.
###############################################################################

SITES=(bs dt ff hb kt la le lh lip sc oe ex ad)
SSIDS=(badsalzuflen detmold Freifunk hornbadmeinberg kalletal lage lemgo leopoldshoehe lippe schoetmar oerlinghausen extertal augustdorf)
typeset -i i=0

# Erzeuge Configs fuer Stable-Branch
for SITE in "${SITES[@]}"
  do
    sed "s/\<lip\>/$SITE/g" site.conf.example | sed "/ssid/s/\<lippe\>/${SSIDS[i]}/g" > sites/$SITE/site.conf
    sed "s/\<lip\>/$SITE/g" site.mk.example > sites/$SITE/site.mk
    i=$i+1
done

# Sonderfall SSID Freifunk - Stable
mv sites/ff/site.conf sites/ff/site-tmp.conf
sed "s/\<Freifunk.freifunk.net\>/Freifunk/g" sites/ff/site-tmp.conf > sites/ff/site.conf
rm -f sites/ff/site-tmp.conf

# Erzeuge Configs fuer Experimental-Branch
for SITE in "${SITES[@]}"
  do
    sed "s/\<lip\>/$SITE/g" site.conf.experimental.example | sed "/ssid/s/\<lippe\>/${SSIDS[i]}/g" > sites-experimental/$SITE/site.conf
    sed "s/\<lip\>/$SITE/g" site.mk.experimental.example > sites-experimental/$SITE/site.mk
    i=$i+1
done

# Sonderfall SSID Freifunk - Experimental
mv sites-experimental/ff/site.conf sites-experimental/ff/site-tmp.conf
sed "s/\<Freifunk.freifunk.net\>/Freifunk/g" sites-experimental/ff/site-tmp.conf > sites-experimental/ff/site.conf
rm -f sites-experimental/ff/site-tmp.conf
