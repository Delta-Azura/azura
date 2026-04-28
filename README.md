# azura
A wrapper for pkgutils and a installer for Onyx.

# Disclaimer
The update function still needs to be tested, same for dependencies handling since they aren't specified in the Pkgfiles for now. 
However you can still use the build and install functions but you will need to manage the dependencies by yourself.

# Installation
Azura is also a tool that allow you to install azura.
For that purpose, the correct usage would be:
``` bash
./azura bootstrap
```
This needs to be run as root and be set as an executable. 
The installer will ask you the partition you want to install Onyx on.
There is almost no post-configuration needed, just change your fstab, run a grub-mkconfig ensuring that os-prober is working, create a user and reboot.

The configuration of the vm needs to be modified on some configurations, please replace the video section by this : 
``` bash
<video>
    <model type="virtio" heads="1" primary="yes">
    <acceleration accel3d="no"/>
    </model>
    <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x0"/>
</video>
```

And the graphics section by this :
``` bash
<graphics type="spice">
    <listen type="none"/>
    <image compression="off"/>
    <gl enable="no"/>
</graphics>
```

A NuTyX is needed as the host system to install Onyx.

Do not hesitate to refer to this repo to get the packages you need, they were built using cards 3.2.3 : 
https://github.com/Delta-Azura/onyx.

Thank you to the GREAT-OS team for storing my core tarball ! 
