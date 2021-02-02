#!/bin/bash
: 'Copyright (C) 2021 FuhrerLemon, Hewel Ochoa'
#!/bin/bash

# Funcion que contiene todos los programas a instalar
function lemon_programs(){
    # Variables
    declare -r Shell=`readJson config.json shell` || exit 1;
    declare -r terminal=`readJson config.json terminal` || exit 1;
    declare -r editor=`readJson config.json editor` || exit 1;
    declare -r navegador=`readJson config.json navegador` || exit 1;
    declare -r aur=`readJson config.json eleccion-aur` || exit 1;
    declare -r DM=`readJson config.json dm` || exit 1;
    declare -r WM=`readJson config.json wm` || exit 1;
    declare -r video=`readJson config.json eleccion-gpu` || exit 1;

    ######
    titulo_
    ######
    # NetWorkManager
        ######
        titulo='networkmanager'
        aumentar_ ${titulo}
        arch-chroot /mnt /bin/bash -c "pacman -S dhcpcd networkmanager iwd net-tools ifplugd --noconfirm >/dev/null 2>&1"
        # Activar servicios
        arch-chroot /mnt /bin/bash -c "systemctl enable dhcpcd NetworkManager >/dev/null 2>&1"
        ######
        echo "noipv6rs" >> /mnt/etc/dhcpcd.conf
        echo "noipv6" >> /mnt/etc/dhcpcd.conf
    echo ''
    ######
    sleep 2

    # GPU Video
    clear
    titulo_
    ######
        titulo=$video
        aumentar_ ${titulo}
        if [ "${video}" == "maquina-virtual" ]
        then
            arch-chroot /mnt /bin/bash -c "pacman -S xf86-video-fbdev mesa mesa-libgl qemu-guest-agent --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ "${video}" == "Nvidea" ]
        then
            arch-chroot /mnt /bin/bash -c "pacman -S xf86-video-nouveau mesa mesa-libgl qemu-guest-agent --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ "${video}" == "AMD" ]
        then
            arch-chroot /mnt /bin/bash -c "pacman -S xf86-video-ati mesa mesa-libgl qemu-guest-agent --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ "${video}" == "INTEL" ]
        then
            arch-chroot /mnt /bin/bash -c "pacman -S xf86-video-intel mesa mesa-libgl qemu-guest-agent --noconfirm >/dev/null 2>&1"
        fi
    echo ''
    ######

     # Terminales
    clear
    titulo_
    ######
        titulo=$terminal
        aumentar_ ${titulo}
        arch-chroot /mnt /bin/bash -c "pacman -S $terminal --noconfirm >/dev/null 2>&1"
    echo ''
    ######

    # Shell
    clear
    titulo_
    ######
        titulo=$Shell
        aumentar_ ${titulo}
        ######
        arch-chroot /mnt /bin/bash -c "pacman -S $Shell --noconfirm >/dev/null 2>&1"
        arch-chroot /mnt /bin/bash -c "chsh -s /bin/$Shell >/dev/null 2>&1"
        arch-chroot /mnt /bin/bash -c "chsh -s /usr/bin/$Shell $user >/dev/null 2>&1"
        arch-chroot /mnt /bin/bash -c "chsh -s /bin/$Shell $user >/dev/null 2>&1"
    echo ''
    ######

    # Editor de texto
    clear
    titulo_
    ######
        titulo=$editor
        aumentar_ ${titulo}
        arch-chroot /mnt /bin/bash -c "pacman -S $editor --noconfirm >/dev/null 2>&1"
    echo ''
    ######
    
    # Xorg
    clear
    titulo_
    ######
        titulo='Xorg'
        aumentar_ ${titulo}
        arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S xorg xorg-apps xorg-xinit xorg-twm xterm xf86-input-libinput --noeditmenu --noconfirm --needed >/dev/null 2>&1"
    echo ''
    ######
    sleep 3

    # Utilidades (Opcionales)
    clear
    titulo_
    ######
        if [ $(cat config.json | jq -r '.general.utilidades.android') == true ]
        then
            titulo='android'
            aumentar_ ${titulo}
            titulo='Extra android'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S android-file-transfer android-tools android-udev msmtp libmtp libcddb gvfs gvfs-afc gvfs-smb gvfs-gphoto2 gvfs-mtp gvfs-goa gvfs-nfs gvfs-google dosfstools jfsutils f2fs-tools btrfs-progs exfat-utils ntfs-3g reiserfsprogs udftools xfsprogs nilfs-utils polkit gpart mtools --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.utilidades.git') == true ]
        then
            clear
            titulo_
            titulo='Git'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S git --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.utilidades.wget') == true ]
        then
            clear
            titulo_
            titulo='Wget'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S wget --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.utilidades.neofetch') == true ]
        then
            clear
            titulo_
            titulo='neofetch'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S neofetch --noconfirm >/dev/null 2>&1"
        fi
    echo ''
    ######
    arch-chroot /mnt /bin/bash -c "pacman -S lsb-release xdg-user-dirs --noconfirm >/dev/null 2>&1"
    arch-chroot /mnt /bin/bash -c "xdg-user-dirs-update >/dev/null 2>&1"
    ######
    arch-chroot /mnt /bin/bash -c "ls /home/$user"

    # Tipografía
    clear
    titulo_
    ######
        titulo='gnu-free-fonts'
        aumentar_ ${titulo}
        arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S nerd-fonts --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        ######
        clear
        titulo_
        titulo='gnome-font-viewer'
        aumentar_ ${titulo}
        ######
        clear
        titulo_
        titulo='ttf-hack ttf-inconsolata'
        aumentar_ ${titulo}
        ######
        clear
        titulo_
        titulo='nerd-fonts'
        aumentar_ ${titulo}
        ######
        arch-chroot /mnt /bin/bash -c "pacman -S gnu-free-fonts ttf-hack ttf-inconsolata gnome-font-viewer --noconfirm >/dev/null 2>&1"
    echo ''
    ######

    # Escritorios (Opcionales)
    clear
    titulo_
    ######
        titulo=$WM
        aumentar_ ${titulo}
        if [ "${WM}" == "qtile" ];then
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S $WM python python2 thunar alacritty network-manager-applet polkit-gnome gnome-keyring lxappearance ly-git rxvt-unicode gnome-themes-extra --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
        ######
        if [ "${WM}" == "bspwm" ];then
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S $WM sxhkd dmenu st thunar network-manager-applet polkit-gnome gnome-keyring lxappearance ly-git rxvt-unicode gnome-themes-extra --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
        if [ "${WM}" == "awesome" ];then
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S $WM st thunar network-manager-applet polkit-gnome gnome-keyring lxappearance ly-git rxvt-unicode gnome-themes-extra --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
        ######
    echo ''
    ######

    # Display Manager
    clear
    titulo_
    ######
        titulo=$DM
        aumentar_ ${titulo}
        if [ "${DM}" == "ly-git"];then
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S $DM --noeditmenu --noconfirm --needed >/dev/null 2>&1"
            echo -e "\t\t\t\tActivando Servicio Display Manager"
            printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' _
            echo -e ""
            arch-chroot /mnt /bin/bash -c "systemctl enable $(cat DMservice)"
        fi
    echo ''
    ######
    sleep 2

    # Aur helper (Opcionales)
    clear
    titulo_
    ######
        if [ "${aur}" == "paru" ]
        then
            titulo=$aur
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S $aur --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
        ######
        if [ "${aur}" == "yay-bin" ]
        then
            titulo=$aur
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S $aur --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
        ######
        if [ "${aur}" == "octopi" ]
        then
            titulo=$aur
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S $aur --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
        ######
    echo ''
    ######

    # Programas extras (Opcionales)
    clear
    titulo_
    ######
        if [ $(cat config.json | jq -r '.general.extra.rofi') == true ]
        then # Menu de busqueda
            titulo='rofi'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S rofi --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.extra.scrot') == true ]
        then # Captura de pantalla
            clear
            titulo_
            titulo='scrot'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S scrot --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.extra.qview') == true ]
        then # Visualizador de imagenes
            clear
            titulo_
            titulo='qview'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S qview --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.extra.pulseaudio') == true ]
        then # Audio
            clear
            titulo_
            titulo='pulseaudio'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S pulseaudio pavucontrol --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.extra.waifai') == true ]
        then # Wifi
            clear
            titulo_
            titulo='wifi'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S iw wireless_tools wpa_supplicant dialog wireless-regdb --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.extra.Bluetuuu') == true ]
        then # Bluetooth
            clear
            titulo_
            titulo='Bluetuuu'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S bluez bluez-utils pulseaudio-bluetooth --noconfirm >/dev/null 2>&1"
        fi
    echo ''
    ######

    # Navegador (Opcionales)
    clear
    titulo_
    ######
        titulo=$navegador
        aumentar_ ${titulo}
        if [ "${navegador}" == "firefox" ];then
            arch-chroot /mnt /bin/bash -c "pacman -S $navegador --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ "${navegador}" == "brave-bin" ];then
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S $navegador --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
    echo ''
    ######

    # Programas de dev (Opcionales)
    clear
    titulo_
    ######
        if [ $(cat config.json | jq -r '.general.dev.gcc') == true ]
        then # Compilador de C, Cpp
            titulo='gcc'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S gcc --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.dev.cmake') == true ]
        then # Cmake
            clear
            titulo_
            titulo='cmake'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "pacman -S cmake --noconfirm >/dev/null 2>&1"
        fi
        ######
        if [ $(cat config.json | jq -r '.general.dev.anaconda') == true ]
        then # Anaconda
            clear
            titulo_
            titulo='anaconda'
            aumentar_ ${titulo}
            arch-chroot /mnt /bin/bash -c "sudo -u $user yay -S anaconda --noeditmenu --noconfirm --needed >/dev/null 2>&1"
        fi
    echo ''
    ######
}
######
