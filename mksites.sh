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
SITES1=(lip ff)
SITES2=(lip ff)
SITES3=(lip ff)
SITES4=(lip ff)
SSID1=(lippe Freifunk)
SSID2=(lippe Freifunk)
SSID3=(lippe Freifunk)
SSID4=(lippe Freifunk)
SSIDEX=(lippe Freifunk)

# Funktionen ##################################################################
# Erzeuge Configs fuer Stable-Branches
create_stable_configs_d1(){
  mkdir -p sites-d1
  typeset -i i=0
    for SITE in "${SITES1[@]}"
      do
        mkdir -p sites-d1/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d1.example | sed "s/\<d1lip\>/d1$SITE/g" > sites-d1/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d1.example > sites-d1/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d2(){
  mkdir -p sites-d2
  typeset -i i=0
    for SITE in "${SITES2[@]}"
      do
        mkdir -p sites-d2/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d2.example | sed "s/\<d2lip\>/d2$SITE/g" > sites-d2/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d2.example > sites-d2/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d3(){
  mkdir -p sites-d3
  typeset -i i=0
    for SITE in "${SITES3[@]}"
      do
        mkdir -p sites-d3/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d3.example | sed "s/\<d3lip\>/d3$SITE/g" > sites-d3/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d3.example > sites-d3/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d4(){
  mkdir -p sites-d4
  typeset -i i=0
    for SITE in "${SITES4[@]}"
      do
        mkdir -p sites-d4/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d4.example | sed "s/\<d4lip\>/d4$SITE/g" > sites-d4/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d4.example > sites-d4/$SITE/site.mk
        i=$i+1
    done
}

# Erzeuge Configs fuer Experimental-Branch
create_experimental_configs_d1(){
  mkdir -p sites-d1-experimental
  typeset -i i=0
    for SITE in "${SITES1[@]}"
      do
        mkdir -p sites-d1-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d1.experimental.example | sed "s/\<d1lip\>/d1$SITE/g" > sites-d1-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d1.experimental.example > sites-d1-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d2(){
  mkdir -p sites-d2-experimental
  typeset -i i=0
    for SITE in "${SITES2[@]}"
      do
        mkdir -p sites-d2-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d2.experimental.example | sed "s/\<d2lip\>/d2$SITE/g" > sites-d2-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d2.experimental.example > sites-d2-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d3(){
  mkdir -p sites-d3-experimental
  typeset -i i=0
    for SITE in "${SITES3[@]}"
      do
        mkdir -p sites-d3-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d3.experimental.example | sed "s/\<d3lip\>/d3$SITE/g" > sites-d3-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d3.experimental.example > sites-d3-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d4(){
  mkdir -p sites-d4-experimental
  typeset -i i=0
    for SITE in "${SITES4[@]}"
      do
        mkdir -p sites-d4-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d4.experimental.example | sed "s/\<d4lip\>/d4$SITE/g" > sites-d4-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d4.experimental.example > sites-d4-experimental/$SITE/site.mk
        i=$i+1
    done
}

# Hauptprogramm ###############################################################
create_stable_configs_d1
create_stable_configs_d2
create_stable_configs_d3
create_stable_configs_d4
create_experimental_configs_d1
create_experimental_configs_d2
create_experimental_configs_d3
create_experimental_configs_d4
exit
