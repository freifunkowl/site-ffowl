#!/bin/bash
###############################################################################
# Autor: Tronde (tronde(at)my-it-brain(dot)de) Datum: 2015-11-11
# Modified by: Collimas 2016-05-15
# Lizenz: GPLv3
#
# Beschreibung:
# Dieses Skript erstellt die Dateien site.conf und site.mk fuer die einzelnen
# Freifunk-Communities von Freifunk-Lippe.
###############################################################################

# Variablen ###################################################################
SITES1=(ex ff lip)
SITES2=(ad dt hb la)
SITES3=(kt le)
SITES4=(bs lh oe sc)
SITESEX=(ex ff lip ad dt hb la kt le bs lh oe sc)
SSID1=(extertal Freifunk lippe)
SSID2=(augustdorf detmold hornbadmeinberg lage)
SSID3=(kalletal lemgo)
SSID4=(badsalzuflen leopoldshoehe oerlinghausen schoetmar)
SSIDEX=(extertal Freifunk lippe augustdorf detmold hornbadmeinberg lage kalletal lemgo badsalzuflen leopoldshoehe oerlinghausen schoetmar)

# Funktionen ##################################################################
# Erzeuge Configs fuer Stable-Branches
create_stable_configs_d01(){
  mkdir -p sites-d01
  typeset -i i=0
    for SITE in "${SITES1[@]}"
      do
        mkdir -p sites-d01/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d01.example | sed "/ssid/s/\<lippe\>/${SSID1[i]}/g" > sites-d01/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d01.example > sites-d01/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d02(){
  mkdir -p sites-d02
  typeset -i i=0
    for SITE in "${SITES2[@]}"
      do
        mkdir -p sites-d02/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d02.example | sed "/ssid/s/\<lippe\>/${SSID2[i]}/g" > sites-d02/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d02.example > sites-d02/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d03(){
  mkdir -p sites-d03
  typeset -i i=0
    for SITE in "${SITES3[@]}"
      do
        mkdir -p sites-d03/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d03.example | sed "/ssid/s/\<lippe\>/${SSID3[i]}/g" > sites-d03/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d03.example > sites-d03/$SITE/site.mk
        i=$i+1
    done
}
create_stable_configs_d04(){
  mkdir -p sites-d04
  typeset -i i=0
    for SITE in "${SITES4[@]}"
      do
        mkdir -p sites-d04/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d04.example | sed "/ssid/s/\<lippe\>/${SSID4[i]}/g" > sites-d04/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d04.example > sites-d04/$SITE/site.mk
        i=$i+1
    done
}

# Sonderfall SSID Freifunk - Stable
create_stable_ssid_freifunk(){
  mv sites-d01/ff/site.conf sites-d01/ff/site-tmp.conf
  sed "s/\<Freifunk.freifunk.net\>/Freifunk/g" sites-d01/ff/site-tmp.conf > sites-d01/ff/site.conf
  rm -f sites-d01/ff/site-tmp.conf
}

# Erzeuge Configs fuer Experimental-Branch
create_experimental_configs_d01(){
  mkdir -p sites-d01-experimental
  typeset -i i=0
    for SITE in "${SITES1[@]}"
      do
        mkdir -p sites-d01-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d01.experimental.example | sed "/ssid/s/\<lippe\>/${SSID1[i]}/g" > sites-d01-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d01.experimental.example > sites-d01-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d02(){
  mkdir -p sites-d02-experimental
  typeset -i i=0
    for SITE in "${SITES2[@]}"
      do
        mkdir -p sites-d02-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d02.experimental.example | sed "/ssid/s/\<lippe\>/${SSID2[i]}/g" > sites-d02-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d02.experimental.example > sites-d02-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d03(){
  mkdir -p sites-d03-experimental
  typeset -i i=0
    for SITE in "${SITES3[@]}"
      do
        mkdir -p sites-d03-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d03.experimental.example | sed "/ssid/s/\<lippe\>/${SSID3[i]}/g" > sites-d03-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d03.experimental.example > sites-d03-experimental/$SITE/site.mk
        i=$i+1
    done
}
create_experimental_configs_d04(){
  mkdir -p sites-d04-experimental
  typeset -i i=0
    for SITE in "${SITES4[@]}"
      do
        mkdir -p sites-d04-experimental/$SITE
        sed "s/\<lip\>/$SITE/g" site.conf.d04.experimental.example | sed "/ssid/s/\<lippe\>/${SSID4[i]}/g" > sites-d04-experimental/$SITE/site.conf
        sed "s/\<lip\>/$SITE/g" site.mk.d04.experimental.example > sites-d04-experimental/$SITE/site.mk
        i=$i+1
    done
}

# Sonderfall SSID Freifunk - Experimental
create_experimental_ssid_freifunk(){
  mv sites-d01-experimental/ff/site.conf sites-d01-experimental/ff/site-tmp.conf
  sed "s/\<Freifunk.freifunk.net\>/Freifunk/g" sites-d01-experimental/ff/site-tmp.conf > sites-d01-experimental/ff/site.conf
  rm -f sites-d01-experimental/ff/site-tmp.conf
}

# Hauptprogramm ###############################################################
create_stable_configs_d01
create_stable_ssid_freifunk
create_stable_configs_d02
create_stable_configs_d03
create_stable_configs_d04
create_experimental_configs_d01
create_experimental_ssid_freifunk
create_experimental_configs_d02
create_experimental_configs_d03
create_experimental_configs_d04
exit
