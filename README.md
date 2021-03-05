# UTouch-repartitioning-script

![](https://raw.githubusercontent.com/micky-it/UTouch-repartitioning-script/master/images/1843.png)
Hi! I created this script to make resizing / partition as easy as possible in your Ubuntu phone. After running this script, your / partition will resize from 2.0G to approx. 7.7G. This script only works if your / partition name is /dev/loop0 ! (In future versions of this script, I will also add an option to resize other partitions)

***Warning! The owner of this script is in no way responsible of any problem with your phone***

***Warning! This is the first version of this script. It has been tested, but some malfunctions may occur***

## Dependencies

Before running this script, install dependencies with the following commands (In your PC):

`$ sudo apt-get install adb`


**In your Ubuntu phone, active the developer mode, then run the following commands in your phone terminal:**

`$ sudo mount -o rw,remount /`

`$ sudo mount -t tmpfs tmpfs /var/cache/apt/archives`

`$ sudo apt update`

`$ sudo apt install android-tools-adb`

## How to use

It is very simple to use this script. Here's what you need to do before running this script:


- Install the above dependencies and set the phone in developer mode
- Plug your phone into your computer
- Run this script **on your computer terminal**
- Follow the instructions of the script

For Mac OS
- Download and install adb and fastboot on your mac
- Download the latest version of the specific script for mac
- Execute the script in the terminal

## Donations
I am 13 years old and I really like computer science and programming. If you think this script was useful for you, you can support me by donating bitcoins to the following address:

> **`bc1qaqh4yfphxq29glg73yn08cxulvrt358260nnk6`**





