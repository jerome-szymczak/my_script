#!/bin/bash

###############################################################################
#
#	2018-09-19 - SZYMCZAK Jérôme
#
#	Base_initialisation_machine_formation.bash param1
#
#	param1 : login de l'utilisateur a ajouté
#
#	Permet la réinstallation des outils nécessaires lors d'une
#	réinitialisation machine de la formation POE
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
clear
echo "#"
echo "## Création de l'utilisateur : jerome"
echo "#"
echo ""

sleep 2

if !(getent passwd jerome)
then
	adduser jerome
	passwd jerome
	usermod -aG wheel jerome
else
	echo "L'utilisateur jerome existe déjà"
	echo ""
fi

# Installation des "repository" nécéssaire
clear
echo "#"
echo "## Instalation du repository EPEL"
echo "#"
echo ""

sleep 2

yum install -y epel-release.noarch

# Installation des mises a jour
clear
echo "#"
echo "## Installation des mises a jour"
echo "#"
echo ""

sleep 2

yum update -y

# Installation des outils utiles
clear
echo "#"
echo "## Installation des outils utiles"
echo "#"
echo ""

sleep 2

yum install -y vim terminator wget curl vlc

# ExFAT support on CentOS7
clear
echo "#"
echo "## Installation du support pour ExFAT"
echo "#"
echo ""

sleep 2

yum install -y http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
yum install -y exfat-utils fuse-exfat


# Installation de VirtualBox
clear
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

# Installation de Cinnamon
clear
echo "#"
echo "## Installation de Cinnamon"
echo "#"
echo ""

sleep 2

yum install -y cinnamon

# Installation de Atom
clear
echo "#"
echo "## Installation de Atom"
echo "#"
echo ""

sleep 2

rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'
yum install -y atom
