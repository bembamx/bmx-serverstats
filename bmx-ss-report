#!/bin/bash
# Script hecho por Tony Cárdenas
# tony@bemba.mx	// www.bemba.mx
# 2017
# Under GNU General Public License v3.0


echo "Load Average:"
BMXLOADAV="$(cat /proc/loadavg | cut -d " " -f1,2,3)"
echo " $BMXLOADAV"

echo " "
echo "CONEXIONES"
echo "[TOTAL]"
BMXTOTAL="$(ss -a | grep "tcp" | grep -c -v "LISTEN")"
echo " $BMXTOTAL"
echo "[ESTAB]"
BMXESTAB="$(ss -a | grep "tcp" | grep -c "ESTAB")"
echo " $BMXESTAB"
echo "[TIME-WAIT]"
BMXTIMEWAIT="$(ss -a | grep "tcp" | grep -c "TIME-WAIT")"
echo " $BMXTIMEWAIT"
echo "[FIN-WAIT]"
BMXFINWAIT="$(ss -a | grep "tcp" | grep -c "FIN-WAIT")"
echo " $BMXFINWAIT"

echo " "

BMXBAND="$(cat /proc/net/dev | grep "em1" | tr -s " ")"
BMXBOUT="$(echo $BMXBAND | cut -d " " -f2)"
BMXBIN="$(echo $BMXBAND | cut -d " " -f10)"

sleep 1s

BMXBAND2="$(cat /proc/net/dev | grep "em1" | tr -s " ")"
BMXBOUT2="$(echo $BMXBAND2 | cut -d " " -f2)"
BMXBIN2="$(echo $BMXBAND2 | cut -d " " -f10)"

echo "TRANSFER-OUT"
BMXRATEOUT="$(($BMXBOUT2 - $BMXBOUT))"
echo " $(echo $BMXRATEOUT | awk '{ foo = $1 / 1024 / 1024 ; print foo " MB" }')"
