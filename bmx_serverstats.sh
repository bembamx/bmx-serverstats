#!/bin/bash
# Script hecho por Tony Cárdenas
# tony@bemba.mx // www.bemba.mx
# 2017
# 


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

echo "TRANSFER-IN"
BMXRATEIN="$(($BMXBIN2 - $BMXBIN))"
echo " $(echo $BMXRATEIN | awk '{ foo = $1 / 1024 / 1024 ; print foo " MB" }')"

echo " "
echo "DISCO DURO"

BMXHD="$(df -h | grep "% /$" | tr -s " ")"
BMXHDTOTAL="$(echo $BMXHD | cut -d " " -f2)"
BMXHDUSADO="$(echo $BMXHD | cut	-d " " -f3)"
BMXHDDISPON="$(echo $BMXHD | cut	-d " " -f4)"
BMXHDPERC="$(echo $BMXHD | cut	-d " " -f5)"
echo " $BMXHDUSADO / $BMXHDTOTAL [$BMXHDPERC]"

echo " "
echo "USUARIOS SSH"
echo "$(who | tr -s " " | cut -d " " -f1,2)"
