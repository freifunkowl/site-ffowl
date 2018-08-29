#!/bin/bash
###############################################################################
# Autor: Tronde (tronde(at)my-it-brain(dot)de) Datum: 2015-11-11
# Modified by: Collimas 2018-07-10
# Lizenz: GPLv3
#
# Beschreibung:
# Dieses Skript erstellt die Dateien site.conf und site.mk fuer die einzelnen
# Freifunk-Communities von Freifunk-Lippe.
###############################################################################

# Variablen ###################################################################
SITES=(lip)
SSID=(lippe)
SSIDEX=(lippe)

# Funktionen ##################################################################
# Erzeuge Configs fuer Stable-Branches
create_stable_configs(){
  mkdir -p sites
  typeset -i i=0
    for SITE in "${SITES[@]}"
      do
        mkdir -p sites/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.example | sed "s/\<d1lip\>/d1$SITE/g" > sites/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.example > sites/$SITE/site.mk
        i=$i+1
    done
}

# Erzeuge Configs fuer Experimental-Branch
create_experimental_configs(){
  mkdir -p sites-experimental
  typeset -i i=0
    for SITE in "${SITES[@]}"
      do
        mkdir -p sites-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.experimental.example | sed "s/\<d1lip\>/d1$SITE/g" > sites-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.experimental.example > sites-experimental/$SITE/site.mk
        i=$i+1
    done
}

# Hauptprogramm ###############################################################
create_stable_configs
create_experimental_configs
exit
