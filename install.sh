#!/bin/bash
#
#  ███████╗██╗  ██╗ ██████╗     
#  ██╔════╝██║ ██╔╝██╔═══██╗    BSPWM - Tiling Window Manager
#  ███████╗█████╔╝ ██║   ██║    Installation script for
#  ╚════██║██╔═██╗ ██║   ██║    
#  ███████║██║  ██╗╚██████╔╝    More info: https://github.com/skolano/BSPWM
#  ╚══════╝╚═╝  ╚═╝ ╚═════╝     
#
SKOS_WORKDIR=$(pwd)


####  INSTALL - ARCHLINUX BASED DISTRO      


INSTALL_ARCH () 
{

    echo "
    ############################################################
    #
    #   :( :( :(
    #   Sorry, but Arch Linux is not supported yet
    #   Stay tuned for updates: https://github.com/skolano/SKOs
    #
    ############################################################
    "

#echo "It's Arch Linux! Let's GO!"

###  Update & Upgrade OS
#sudo pacman -Syu
#
### Install Aur helper
#sudo pacman -S --needed base-devel --noconfirm
#sudo pacman -S git --noconfirm
#cd $SKOS_WORKDIR
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si PKGBUILD
#
#cd $SKOS_WORKDIR
#yay -Sy --noconfirm - < pkglist

}



####  INSTALL - UBUNTU BASED DISTRO  


INSTALL_UBUNTU () 
{
    echo "
    ############################################################
    #
    #   :( :( :(
    #   Sorry, but Ubuntu is not supported yet
    #   Stay tuned for updates: https://github.com/skolano/SKOs
    #
    ############################################################
    "
}


####  INSTALL - FEDORA BASED DISTRO               


INSTALL_FEDORA () 
{
    echo echo "It's Fedora! Let's GO!"

    sudo dnf update -y
    sudo dnf install -y $(< fedorapkg.txt)


}



####  DISTRO CHALLANGE & INSTAL BSPWM           


DISTRO_ARCH="ID_LIKE=arch"
DISTRO_UBUNTU="ID_LIKE=ubuntu"
DISTRO_FEDORA="ID=fedora"
DISTRONAME=$(grep '^ID_LIKE' /etc/os-release)
DISTRONAME=$(grep '^ID' /etc/os-release)
if [[ "$DISTRO_ARCH" == "$DISTRONAME"  ]]; then
 
    INSTALL_ARCH

elif [[ "$DISTRO_UBUNTU" == "$DISTRONAME"  ]]; then
 
    INSTALL_UBUNTU

elif [[ "$DISTRO_FEDORA" == "$DISTRONAME"  ]]; then
  
    INSTALL_FEDORA

else
    echo "
    ############################################################
    #
    #   :( :( :(
    #   Sorry, this distro is not supported yet.
    #   Stay tuned for updates: https://github.com/skolano/SKOs
    #
    ############################################################
    "
    exit
fi 


#### MOVE CONFIG FILES TO SPECYFIC FOLDERS
cd $SKOS_WORKDIR
rsync -avh dotfiles/ $HOME
sudo rsync -avh usr/share/ /usr/share

echo "
BSPWM is installed. Please reboot your computer.
"
















