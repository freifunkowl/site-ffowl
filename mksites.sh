#!/bin/bash
###############################################################################
# Autor: Tronde (tronde(at)my-it-brain(dot)de)
# Datum: 2015-11-11
# Lizenz: GPLv3
#
# Beschreibung:
# Dieses Skript erstellt die Dateien site.conf und site.mk fuer die einzelnen
# Freifunk-Communities von Freifunk-Lippe.
###############################################################################

SITES=(bo bs dt ff hb kt la le lh lip sc ts)
SSIDS=(badoeynhausen badsalzuflen detmold Freifunk hornbadmeinberg kalletal lage lemgo leopoldshoehe lippe schoetmar 'lippe-test')
typeset -i i=0

for SITE in "${SITES[@]}"
  do
    sed "s/\<lip\>/$SITE/g" site.conf.example | sed "/ssid/s/\<lippe\>/${SSIDS[i]}/g" > sites/$SITE/site-test.conf
    sed "s/\<lip\>/$SITE/g" site.mk.example > sites/$SITE/site-test.mk
    i=$i+1
done
