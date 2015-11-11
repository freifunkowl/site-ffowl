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

for SITE in "${SITES[@]}"
  do
    sed 's/\<lip\>/$SITE/g' site.conf.example > sites/$SITE/site-test.conf
done

for SSID in "${SSIDS[@]}"
  do
    sed '/ssid/s/\<lippe\>/$SSID/g' site.mk.example > sites/$SITE/site-test.mk
done
