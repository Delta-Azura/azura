# azura
A wrapper for pkgutils

# Disclaimer
The update function still needs to be tested, same for dependencies handling since they aren't specified in the Pkgfiles for now. 
However you can still use the build and install functions but you will need to manage the dependencies by yourself

# Installation
Azura is also a tool that allow you to install azura.
For that purpose, the correct usage would be 
''' bash
./azura bootstrap
'''
This needs to be run as root and be set as an executable. 
The install will ask you the partition you want to install Onyx on.
Some post-installation is still needed unfortunately, you must enter the chroot for the coming instructions.
Please refer to the shadow post-installation and do not forget to set up your root password afterwards.
Also these commands need to be ran for systemd : systemd-machine-id-setup && systemctl preset-all.
Finally do not forget to compile your kernel following your own needs and correct the fstab.

Do not hesitate to refer to this repo to get the packages you need, they were built using cards 3.2.3 : 
https://github.com/Delta-Azura/onyx.

Thank you to the GREAT-OS team for storing my core tarball ! 
