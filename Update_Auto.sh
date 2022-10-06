#!/bin/bash
#Met à jour automatiquement, plus envoie des logs par mail.
#Variables
UPDATE_NOM=$(date +%Y%m%d-%H%M%S)
LOG="/var/log/apt"
#FIN
apt update
apt list --upgradable > ${LOG}/upgradable.log 2>/dev/null
apt upgrade -y 2>/dev/null
apt auto-remove -y 2>/dev/null
echo "Update : ${UPDATE_NOM}-fini. Tous les paquets sont à jours"| mail -s "UPDATE AUTO" mail@gmail.com -A ${LOG}/term.log -A ${LOG}/history.log -A ${LOG}/upgradable.log
rm ${LOG}/*
