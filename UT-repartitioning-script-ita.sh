#!/bin/bash


export BLUE="\e[1;34m"
export RED="\e[0;31m"
export Z="\e[0m"
export LRED="\e[1;31m"
export GREEN="\e[0;32m"
export LCYAN="\e[1;36m"
export LGREEN="\e[1;32m"


echo -e "$BLUE
                             ********************************************************************
                             *                                                                  *
                             *                          Michele Script                          *
                             *                                                                  *
                             *                 Ubuntu touch partitioning script                 *
                             *                                                                  *
                             ******************************************************************** $Z"


echo -n -e "$GREEN\bSei sicuro di voler eseguire questo script? Leggi la guida su GitHub prima di eseguire questo script! [s/n]: $Z"
read VAR
  
  
if [[ $VAR = s ]]
then 
  echo -e "$LCYAN\bAvvio... $Z"
  adb root
  var=$(adb shell sudo dd if=/dev/zero bs=1MiB of=/userdata/system.img conv=notrunc oflag=append count=6000)
    if [[ $? = 0 ]]
	then
	  adb shell sudo losetup -c /dev/loop0
      echo -e "$LGREEN\bLo script è stato eseguito con successo! Adesso il tuo telefono verrà riavviato in recovery mode per la seconda parte dello script. $Z"
	  adb reboot recovery
	  echo -n "Dopo che il tuo telefono sarà andato in recovery mode, schiaccia un tasto per continuare..."
	  read VAR2
	  
	    if [[ -z "$VAR2" ]]
		then
		  echo -e "
          $LCYAN\bBenvenuto nella seconda parte dello script. Questa operazione potrebbe richiedere un po' di tempo. $Z"
          
		  adb root
          adb shell losetup /dev/block/loop0 /data/system.img
          adb shell e2fsck -f /dev/block/loop0
          adb shell resize2fs -f /dev/block/loop0
		  
		  echo -e "
          $LGREEN\bAdesso la tua partizione è stata ridimensionata! Il tuo telefono verra riavviato automaticamente. Divertiti con il tuo Ubuntu phone! 
          $Z"
	      
		  adb shell reboot
		  
          exit 0
		  
		else
		  exit 0
		  
		fi
	
	else
	  adb shell sudo losetup -c /dev/loop0
	  echo -e "$LRED\bC'è stato un errore! $Z"
	  exit 0
	fi
    
elif [[ $VAR = n ]]
then
  exit 0
  

fi

