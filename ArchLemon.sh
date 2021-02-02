#!/bin/bash
: 'Copyright (C) 2021 FuhrerLemon, Hewel Ochoa'
#!/bin/bash
source ./ReadJson.sh
source ./ProgressBar.sh
source ./LemonPrograms.sh

# Funcion título "ArchLemon"
function titulo_(){
	echo -e "\t\t\t       ${cyan}. ${fin}                                                           		"
	echo -e "\t\t\t      ${cyan}/ \ ${fin}                                                          		"
	echo -e "\t\t\t     ${cyan}/   \ ${fin}    ${amarillo} _                                   	  ${fin}"
	echo -e "\t\t\t    ${cyan}/^.   \ ${fin}   ${amarillo}| |    ___ _ __ ___   ___  _ __     	  ${fin}"
	echo -e "\t\t\t   ${cyan}/  .-.  \ ${fin}  ${amarillo}| |   / _ \ '_   _ \ / _ \| '_ \    	  ${fin}"
	echo -e "\t\t\t  ${cyan}/  (   ) _\ ${fin} ${amarillo}| |__|  __/ | | | | | (_) | | | |   	  ${fin}"
	echo -e "\t\t\t ${cyan}/ _.~   ~._^\ ${fin}${amarillo}|_____\___|_| |_| |_|\___/|_| |_|   	  ${fin}"
	echo -e "\t\t\t${cyan}/.^         ^.\ ${fin}          ${rojo}Autores:${fin} ${cyan}Vanger, Hewel${fin}"
}

# Funcion de aumento de la barra de progreso
function aumentar_(){
	declare -r aumento=(0 10 20 30 40 50 60 70 80 90 100) # Arreglo de 0...100
	for i in ${aumento[@]} 
	do # Ciclo de aumento
		progress_bar $i ${verde_claro} ${titulo} ${cyan} ${azul_claro} ${rosado} ${blanco} ${morado} ${fin}
	done
}

# Variables globales																		# Cambiar los config.json
declare -r disco=$(cat config.json | jq -r '."general"."disco"') 							# /dev/sda disco a particionar
declare -r user=$(cat config.json | jq -r '."general"."usuario"."nombre"') 					# Nombre de usuario
declare -r hostname=$(cat config.json | jq -r '."general"."hostname"."host"') 				# Nombre de la pc
declare -r root_passwd=$(cat config.json | jq -r '."general"."hostname"."contraroot"') 		# Contraseña del usuario root
declare -r user_passwd=$(cat config.json | jq -r '."general"."usuario"."contrausuario"')	# Contraseña del usuario
declare -r user_pais=$(cat config.json | jq -r '."general"."idioma-teclado"."pais"')		# País del usuario
declare -r keymap=$(cat config.json | jq -r '."general"."idioma-teclado"."keymap"') 		# Teclado
declare -r swap=$(cat config.json | jq -r '."general"."particion"."swap"')					# +2G	 particion swap
declare -r root=$(cat config.json | jq -r '."general"."particion"."root"')					# +20G	 particion root
declare -r efi=$(cat config.json | jq -r '."general"."particion"."efi"')					# +200M  particion efi
declare -r boot=$(cat config.json | jq -r '."general"."particion"."boot"')					# +100M  particion boot
																				# ""	 partición home
																				# La partición home se creará con el resto de la memoria

# Paleta de colores del Script
declare -r rojo='\e[31m'				# rojo
declare -r rojo_claro='\e[1;31m'		# rojo claro
declare -r negro='\e[30m'				# negro
declare -r blanco='\e[1;37m'			# blanco
declare -r gris_oscuro='\e[1;30m'		# gris oscuro
declare -r gris_claro='\e[37m'			# gris claro
declare -r azul='\e[34m'				# azul
declare -r azul_claro='\e[1;34m'		# azul claro
declare -r verde='\e[32m'				# verde
declare -r verde_claro='\e[1;32m'		# verde claro
declare -r cyan='\e[36m'				# cyan
declare -r light_cyan='\e[1;36m'		# cyan claro
declare -r morado='\e[35m'				# morado
declare -r morado_claro='\e[1;35m'		# morado claro
declare -r chocolate='\e[33m'			# chocolate
declare -r amarillo='\e[1;33m'			# amarillo
declare -r rosado='\033[1;33m'			# rosado

# Background
declare -r B_negro='\e[40m'       		# negro
declare -r B_rojo='\e[41m'				# rojo
declare -r B_verde='\e[42m'       		# verde
declare -r B_amarillo='\e[43m'      	# amarillo
declare -r B_azul='\e[44m'        		# azul
declare -r B_morado='\e[45m'      		# morado
declare -r B_cyan='\e[46m'        		# Cyan
declare -r B_Blanco='\e[47m'			# blanco

declare -r fin='\e[0m'					# Termina secuencia de colores

# Estableciendo Idioma del sistema
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Sistema en ${rojo}español${fin}----------]"
	echo 'es_ES.UTF-8 UTF-8' > /etc/locale.gen
	locale-gen
	echo 'LANG=es_ES.UTF-8' > /etc/locale.conf
	export LANG=es_ES.UTF-8
echo ''
sleep 2

# Actualización de llaves y mirroslist
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Llaves del ${cyan}sistema${fin}----------]"
	pacman -Sy archlinux-keyring --noconfirm
	clear
	pacman -Sy reflector python rsync --noconfirm
echo ''
######
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Actualizando ${verde}MirrorList${fin}----------]"
	reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist
	clear
	cat /etc/pacman.d/mirrorlist
echo ''
sleep 2

# Disco
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Configuración ${rosado}datos usuario${fin}----------]"
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' _
	echo "print devices" | parted | grep /dev/ | awk '{if (NR!=1) {print}}'
	echo ''
	echo -e "${amarillo}[*]${fin} ${morado}Disco${fin}: $disco"
	echo ''
	echo -e "${amarillo}[*]${fin} ${morado}Usuario${fin}: $user"
	echo ''
	echo -e "${amarillo}[*]${fin} ${morado}Clave de usuario${fin}: $user_passwd"
	echo ''
	echo -e "${amarillo}[*]${fin} ${morado}Clave root${fin}: $root_passwd"
echo ''
sleep 2
######
uefi=$( ls /sys/firmware/efi/ | grep -ic efivars )

if [ $uefi == 1 ]
then
	clear
	titulo_
	echo ''
	echo -e "\t\t\t[----------Sistema ${verde}UEFI${fin}----------]"
		# Metodo con EFI - SWAP - ROOT - HOME
		sgdisk --zap-all ${disco}
		parted ${disco} mklabel gpt
		sgdisk ${disco} -n=1:0:+${efi}  -t=1:ef00
		sgdisk ${disco} -n=2:0:+${swap} -t=2:8200
		sgdisk ${disco} -n=3:0:+${root} -t=3:8300
		sgdisk ${disco} -n=4:0:0
		fdisk -l ${disco} > /tmp/partition
		echo ''
		echo ''
		cat /tmp/partition
		sleep 2
		######
		partition="$(cat /tmp/partition | grep /dev/ | awk '{if (NR!=1) {print}}' | sed 's/*//g' | awk -F ' ' '{print $1}')"
		######
		echo $partition | awk -F ' ' '{print $1}' >  boot-efi
		echo $partition | awk -F ' ' '{print $2}' >  swap-efi
		echo $partition | awk -F ' ' '{print $3}' >  root-efi
		echo $partition | awk -F ' ' '{print $4}' >  home-efi
		######
		echo ''
		echo -e "\t\t${amarillo}[*]${fin} Partición ${azul}EFI${fin} es:"
		cat boot-efi
		echo ''
		echo -e "\t\t${amarillo}[*]${fin} Partición ${morado}SWAP${fin} es:"
		cat swap-efi
		echo ''
		echo -e "\t\t${amarillo}[*]${fin} Partición ${rojo}ROOT${fin} es:"
		cat root-efi
		echo ''
		echo -e "\t\t${amarillo}[*]${fin} Partición ${verde}HOME${fin} es:"
		cat home-efi
	echo ''
	sleep 2
    ######
	clear
	titulo_
	echo ''
		echo -e "\t\t\t[----------Formateando ${amarillo}Particiones${fin}----------]"
		mkfs.ext4 $(cat root-efi)
		mount $(cat root-efi) /mnt 
		######
		mkdir -p /mnt/home
		mkfs.ext4 $(cat home-efi)
		mount $(cat home-efi) /mnt/home
		######
		mkdir -p /mnt/efi
		mkfs.fat -F 32 $(cat boot-efi)
		mount $(cat boot-efi) /mnt/efi
		######
		mkswap $(cat swap-efi)
		swapon $(cat swap-efi)
	echo ''
	sleep 2
    ######
	clear
	titulo_
	echo ''
		echo -e "\t\t\t[----------Revisando punto de montaje en ${rojo_claro}MOUNTPOINT${fin}----------]"
		lsblk -l
	echo ''
	sleep 2
else
	clear
	titulo_
	echo ''
	echo -e "\t\t\t[----------Sistema ${verde}BIOS${fin}----------]"
		# Metodo con BIOS - SWAP - ROOT- HOME
		sgdisk --zap-all ${disco}
		(echo o; echo n; echo p; echo 1; echo ""; echo $boot; echo n; echo p; echo 2; echo ""; echo $swap; echo n; echo p; echo 3; echo ""; echo $root; echo n; echo p; echo 4; echo ""; echo ""; echo t; echo 2; echo 82; echo a; echo 1; echo w; echo q) | fdisk ${disco}
		######
		fdisk -l ${disco} > /tmp/partition 
		cat /tmp/partition
		sleep 2
		######
		partition="$(cat /tmp/partition | grep /dev/ | awk '{if (NR!=1) {print}}' | sed 's/*//g' | awk -F ' ' '{print $1}')"
		######
		echo $partition | awk -F ' ' '{print $1}' >  boot-bios
		echo $partition | awk -F ' ' '{print $2}' >  swap-bios
		echo $partition | awk -F ' ' '{print $3}' >  root-bios
		echo $partition | awk -F ' ' '{print $4}' >  home-bios
		######
		echo ''
		echo -e "\t\t${amarillo}[*]${fin} Partición ${azul}BOOT${fin} es:" 
		cat boot-bios
		echo ''
		echo -e "\t\t${amarillo}[*]${fin} Partición ${morado}SWAP${fin} es:"
		cat swap-bios
		echo ''
		echo -e "\t\t${amarillo}[*]${fin} Partición ${rojo}ROOT${fin} es:"
		cat root-bios
		echo ''
		echo -e "\t\t${amarillo}[*]${fin} Partición ${verde}HOME${fin} es:"
		cat home-bios
	echo ''
	sleep 2
    ######
	clear
	titulo_
	echo ''
		echo -e "\t\t\t[----------Formateando ${amarillo}Particiones${fin}----------]"
		mkfs.ext4 $(cat root-bios) 
		mount $(cat root-bios) /mnt 
		######
		mkdir -p /mnt/boot
		mkfs.ext4 $(cat boot-bios) 
		mount $(cat boot-bios) /mnt/boot
		######
		mkdir -p /mnt/home
		mkfs.ext4 $(cat home-bios) 
		mount $(cat home-bios) /mnt/home
		######
		mkswap $(cat swap-bios) 
		swapon $(cat swap-bios)
	echo ''
	sleep 2
    ######
	clear
	titulo_
	echo ''
		echo -e "\t\t\t[----------Revisando punto de montaje en ${rojo_claro}MOUNTPOINT${fin}----------]"
		lsblk -l
	echo ''
	sleep 2
fi

clear
titulo_
echo ''
	echo -e "\t\t\t[----------Instalando ${verde_claro}Sistema base${fin}----------]"
	pacstrap /mnt base base-devel nano reflector python rsync
echo ''
sleep 2
######
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Archivo ${morado}FSTAB${fin}----------]"
	echo "genfstab -p /mnt >> /mnt/etc/fstab"
	echo ''
	######
	genfstab -p /mnt >> /mnt/etc/fstab
	cat /mnt/etc/fstab
echo ''
sleep 2

# Pacman configuración
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Configuración de ${morado_claro}pacman${fin}----------]"
	sed -i 's/#Color/Color/g' /mnt/etc/pacman.conf
	sed -i 's/#TotalDownload/TotalDownload/g' /mnt/etc/pacman.conf
	sed -i 's/#VerbosePkgLists/VerbosePkgLists/g' /mnt/etc/pacman.conf
	######
	sed -i "37i ILoveCandy" /mnt/etc/pacman.conf
	######
	sed -i '93d' /mnt/etc/pacman.conf
	sed -i '94d' /mnt/etc/pacman.conf
	sed -i "93i [multilib]" /mnt/etc/pacman.conf
	sed -i "94i Include = /etc/pacman.d/mirrorlist" /mnt/etc/pacman.conf
echo ''
sleep 2

# hosts
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Nombre del ${gris_claro}computador${fin}----------]"
	echo "$hostname" > /mnt/etc/hostname
	echo "127.0.1.1 $hostname.localdomain $hostname" > /mnt/etc/hosts
	echo ''
	echo "Hostname: $(cat /mnt/etc/hostname)"
	echo ''
	echo "Hosts: $(cat /mnt/etc/hosts)"
echo ''
sleep 2

# Admin perraaa
clear
titulo_
echo ''
	echo -e "\t\t\t[----------${cyan}Admin${fin}----------]"
	arch-chroot /mnt /bin/bash -c "(echo $root_passwd ; echo $root_passwd) | passwd root"
	arch-chroot /mnt /bin/bash -c "useradd -m -g users -s /bin/bash $user"
	arch-chroot /mnt /bin/bash -c "(echo $user_passwd ; echo $user_passwd) | passwd $user"
	######
	sed -i "80i $user ALL=(ALL) ALL"  /mnt/etc/sudoers
echo ''
sleep 2

# Idioma y Zona horaria
clear
titulo_
echo '' 
	echo -e ''
	echo -e "\t\t\t[----------${verde_claro}Idioma del Sistema${fin}----------]"
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' _
	echo -e ''
	######
	echo "$user_pais UTF-8" > /mnt/etc/locale.gen
	arch-chroot /mnt /bin/bash -c "locale-gen" 
	echo "LANG=$user_pais" > /mnt/etc/locale.conf
	echo ''
	cat /mnt/etc/locale.conf 
	cat /mnt/etc/locale.gen
	sleep 2
	echo ''
	arch-chroot /mnt /bin/bash -c "export $(cat /mnt/etc/locale.conf)" 
	export $(cat /mnt/etc/locale.conf)
	arch-chroot /mnt /bin/bash -c "sudo -u $user export $(cat /etc/locale.conf)"
	export $(cat /mnt/etc/locale.conf)
echo ''
sleep 2
######
clear
titulo_
echo '' 
	echo -e "\t\t\t[----------Actualizando ${azul_claro}Zona horaria${fin}----------]"
	arch-chroot /mnt /bin/bash -c "pacman -Sy curl --noconfirm"
	arch-chroot /mnt /bin/bash -c "ln -sf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime"
echo '' 
sleep 2

# Opcional
clear
titulo_
echo ''
	echo -e "\t\t\t[----------${red}KeyMap${fin}----------]"
	echo "KEYMAP=es" > /mnt/etc/vconsole.conf 
	cat /mnt/etc/vconsole.conf 
	clear
	######
	arch-chroot /mnt /bin/bash -c "timedatectl set-timezone $(curl https://ipapi.co/timezone)"
	arch-chroot /mnt /bin/bash -c "pacman -S ntp --noconfirm"
	clear
	arch-chroot /mnt /bin/bash -c "ntpd -qg"
	arch-chroot /mnt /bin/bash -c "hwclock --systohc"
echo ''
sleep 2

# Actualizando lista de mirror
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Actualizando ${verde_claro}MirrorList${fin}----------]"
	echo ''
	arch-chroot /mnt /bin/bash -c "reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist"
	sleep 2
	clear
	echo -e "[----------${amarillo}Lista de MirrorList${fin}----------]"
	cat /mnt/etc/pacman.d/mirrorlist
echo ''

# Instalación del kernel
clear
titulo_
echo ''
	titulo='Kernel'
	aumentar_ ${titulo}
	cp pacman.conf /mnt/etc/pacman.conf
	arch-chroot /mnt /bin/bash -c "pacman -Syu --noconfirm"
	arch-chroot /mnt /bin/bash -c "pacman -Syu --noconfirm"
	arch-chroot /mnt /bin/bash -c "pacman -Sy alsi yay-bin --noconfirm --needed"
	arch-chroot /mnt /bin/bash -c "pacman -S linux-zen linux-zen-headers linux-firmware mkinitcpio --noconfirm"
	arch-chroot /mnt /bin/bash -c "pacman -S pacman-mirrorlist cryptsetup lvm2 logrotate nano hddtemp unzip zip --noconfirm --needed"
	arch-chroot /mnt /bin/bash -c "pacman -S dnsmasq ethtool ndisc6 inetutils wvdial gptfdisk dhcp dhcpcd dhclient ppp netctl networkmanager --noconfirm --needed"
	arch-chroot /mnt /bin/bash -c "pacman -S iwd net-tools ifplugd dialog neofetch git wget lsb-release accountsservice bash-completion --noconfirm --needed"
	arch-chroot /mnt /bin/bash -c "pacman -S less ntp usb_modeswitch usbutils which mtools exfat-utils --noconfirm --needed"
echo ''
######
uefi=$( ls /sys/firmware/efi/ | grep -ic efivars )
# Kernel Zen

if [ $uefi == 1 ]
then
    clear
	titulo_
	echo ''
		echo -e "\t\t\t[----------${cyan}Grub del sistema${fin}----------]"
		arch-chroot /mnt /bin/bash -c "pacman -S grub efibootmgr os-prober dosfstools --noconfirm"
		echo ''
		echo 'Instalando EFI System >> bootx64.efi'
		arch-chroot /mnt /bin/bash -c 'grub-install --target=x86_64-efi --efi-directory=/efi --removable'
		echo ''
		echo 'Instalando UEFI System >> grubx64.efi'
		arch-chroot /mnt /bin/bash -c 'grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=Arch'
		######
		sed -i "6iGRUB_CMDLINE_LINUX_DEFAULT="loglevel=3"" /mnt/etc/default/grub
		sed -i '7d' /mnt/etc/default/grub
		######
		echo ''
		arch-chroot /mnt /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg"
		echo ''
		echo 'ls -l /mnt/efi'
		ls -l /mnt/efi
    echo ''
    sleep 2
else
    clear
	titulo_
	echo ''
		echo -e "\t\t\t[----------${cyan}Grub del sistema${fin}----------]"
		arch-chroot /mnt /bin/bash -c "pacman -S grub os-prober --noconfirm"
		echo ''
		arch-chroot /mnt /bin/bash -c "grub-install --target=i386-pc $disco"
		######
		sed -i "6iGRUB_CMDLINE_LINUX_DEFAULT="loglevel=3"" /mnt/etc/default/grub
		sed -i '7d' /mnt/etc/default/grub
		######
		echo ''
		arch-chroot /mnt /bin/bash -c "grub-mkconfig -o /boot/grub/grub.cfg"
		echo ''
		echo 'ls -l /mnt/boot'
		ls -l /mnt/boot
    echo ''
	sleep 2
fi

# Llamando funcion, para instalar los programas
clear
lemon_programs ${user}

# Establecer formato de teclado
clear
titulo_
echo ''
	echo -e "\t\t\t[----------Formato del ${rojo_claro}teclado${fin}----------]"
	arch-chroot /mnt /bin/bash -c "localectl --no-convert set-x11-keymap $keymap"
	arch-chroot /mnt /bin/bash -c "setxkbmap -layout $keymap"
	######
	echo -e 'Section "InputClass"' > /mnt/etc/X11/xorg.conf.d/00-keyboard.conf
	echo -e 'Identifier "system-keyboard"' >> /mnt/etc/X11/xorg.conf.d/00-keyboard.conf
	echo -e 'MatchIsKeyboard "on"' >> /mnt/etc/X11/xorg.conf.d/00-keyboard.conf
	echo -e 'Option "XkbLayout" "latam"' >> /mnt/etc/X11/xorg.conf.d/00-keyboard.conf
	echo -e 'EndSection' >> /mnt/etc/X11/xorg.conf.d/00-keyboard.conf
	echo '\n\n'
	cat /mnt/etc/X11/xorg.conf.d/00-keyboard.conf
echo ''

# Desmontar y reiniciar
clear
titulo_
echo ''
umount -R /mnt
swapoff -a
	  clear
	  titulo_
      echo ''
	  titulo="Reiniciando Pc"
      aumentar_ ${titulo}
reboot
######
