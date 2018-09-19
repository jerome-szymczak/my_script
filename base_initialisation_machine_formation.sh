#!/bin/bash

###############################################################################
#
#	2018-09-19 - SZYMCZAK Jérôme	
#
#	Base_initialisation_machine_formation.sh
#
#	Permet la réinstallation des outils nécessaires lors d'une
#	réinitialisation machine de la formation POE
#
#
#
#
#
###############################################################################

# Passage en Super Utilisateur
#echo "#"
#echo "## Passage en Super utilisateur"
#echo "#"
#echo ""
#
#sudo su

#Creation d'un utilisateur
echo "#"
echo "## Création de l'utilisateur : jerome"
echo "#"
echo ""

adduser jerome
passwd jerome

# Installation des "repository" nécéssaire
echo "#"
echo "## Instalation du repository EPEL"
echo "#"
echo ""

sleep 2

yum install -y epel-release.noarch

# Installation des outils utiles
echo "#"
echo "## Installation des outils utiles"
echo "#"
echo ""

sleep 2

yum install -y vim terminator

# ExFAT support on CentOS7
echo "#"
echo "## Installation du support pour ExFAT"
echo "#"
echo ""

sleep 2

yum install -y http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
yum install -y exfat-utils fuse-exfat


# Installation de VirtualBox
echo "#"
echo "## Installation de VirtualBox"
echo "#"
echo ""

sleep 2

cd /etc/yum.repos.d
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
cd
yum install -y dkms
yum install -y kernel-devel
yum install -y VirtualBox-5.2
/sbin/vboxconfig
