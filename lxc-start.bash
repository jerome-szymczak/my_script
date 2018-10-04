#!/bin/bash -eu

###############################################################################
#
#	2018-10-03 - Cyril GERARD
#
#	lxc-start.bash param1 param2 ...
#		param1	nom du container a démarrer
#
#
#	Permet le démarrage des containers contenues dans le dossier /var/lib/lxc
#	si aucun argument n'est founie.
# OU
# démarre les containers passés en paramétre
#
###############################################################################

if test -z "$*"
then
	CONTAINERS=$(ls /var/lib/lxc/)
else
  if [[ $1 == '-h' ]];
  then
    echo "$(basename "$0") [-h] [arguments] -- programme pour lancer des containers LXC.

    Exemple:
        $(basename "$0") -h             Montre l'aide
        $(basename "$0")          Lance tous les containers
        $(basename "$0") [arguments]  Lance le(s) container(s) que vous avez passé en argument."
    exit 0;
  fi
	CONTAINERS=$*
fi
for container in $CONTAINERS; do
  if [ "$(lxc-info -n $container -s)" != "State:          STOPPED" ]; then
    echo "'$container' fonctionne deja, on zappe la commande."
  else
    echo "Demarrage de '$container'..."
    lxc-start -dn $container &
  fi
done
