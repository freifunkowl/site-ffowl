#!/bin/bash
###############################################################################
# Autor: Tronde (tronde(at)my-it-brain(dot)de) Datum: 2015-11-11
# Modified by: Collimas 2020-02-07
# Lizenz: GPLv3
#
# Beschreibung:
# Dieses Skript erstellt die Dateien site.conf und site.mk fuer die einzelnen
# Freifunk-Communities von Freifunk-Lippe.
###############################################################################

# Variablen ###################################################################
SITES=(lip spz)
SSID=(lippe)
SSIDEX=(lippe)

# Funktionen ##################################################################
# Erzeuge Configs fuer Stable-Branch
create_stable_configs(){
  mkdir -p sites-stable
  typeset -i i=0
    for SITE in "${SITES[@]}"
      do
        mkdir -p sites-stable/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.stable.example | sed "s/\<d1lip\>/d1$SITE/g" > sites-stable/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.stable.example > sites-stable/$SITE/site.mk
        i=$i+1
    done
}

# Hauptprogramm ###############################################################
create_stable_configs
exit
