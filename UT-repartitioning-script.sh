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
                             *                         Michele's Script                         *
                             *                                                                  *
                             *                 Ubuntu touch partitioning script                 *
                             *                                                                  *
                             ******************************************************************** $Z"


echo -n -e "$GREEN\bAre you sure you want to execute this script? Read the guide in GitHub before using this script! [y/n]: $Z"
read VAR
  
  
if [[ $VAR = y ]]
then 
  echo -e "$LCYAN\bStarting... $Z"
  adb root
  var=$(adb shell sudo dd if=/dev/zero bs=1MiB of=/userdata/system.img conv=notrunc oflag=append count=6000)
    if [[ $? = 0 ]]
	then
	  adb shell sudo losetup -c /dev/loop0
      echo -e "$LGREEN\bThe script was executed successfully! Now your phone will be rebooted in recovery mode for part two of the script. $Z"
	  adb reboot recovery
	  echo -n "After your phone went into recovery mode, press any key to continue..."
	  read VAR2
	  
	    if [[ -z "$VAR2" ]]
		then
		  echo -e "
          $LCYAN\bWelcome to the second part of Ubuntu touch partitioning script. It can take a while to complete. $Z"
          
		  adb root
          adb shell losetup /dev/block/loop0 /data/system.img
          adb shell e2fsck -f /dev/block/loop0
          adb shell resize2fs -f /dev/block/loop0
		  
		  echo -e "
          $LGREEN\bNow your partition is resized! Now your phone will automatically restart. Enjoy your Ubuntu phone! 
          $Z"
	      
		  adb shell reboot
		  
          exit 0
		  
		else
		  exit 0
		  
		fi
	
	else
	  adb shell sudo losetup -c /dev/loop0
	  echo -e "$LRED\bAn error has occurred! Please see the guide for more details $Z"
	  exit 0
	fi
    
elif [[ $VAR = n ]]
then
  exit 0
  

fi

