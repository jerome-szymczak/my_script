#!/bin/bash

###############################################################################
#
#	2018-09-27 - SZYMCZAK Jérôme
#
#	sauvegarde_formation.bash
#
#
#
#	Permet la sauvagarde de repertoire de la formation
#	http://formation/formation/
# dans le repertoire formation : /home/jerome/Documents/formation
#
#
###############################################################################

## Test si le dossier formation existe dans le repertoire home de jerome
## Sinon création
#if [ ! -d "/home/jerome/Documents/formation" ]
#then
#  echo "Création du formation !"
#  mkdir -p /home/jerome/Documents/formation
#fi

cd /home/jerome/Documents

echo "Récupération du répertoire de la formation !"

wget -r -np http://formation/formation/

mv formation/formation/* formation/

rmdir formation/formation
