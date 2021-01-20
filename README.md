# ArchLemon  
## **Indíce**
- [Configuración](#Configuraci%C3%B3n)
- [Instalación](#Instalaci%C3%B3n)
- [Colaborador](#Colaborador)
### Configuración
Puedes cambiar los valores en config.json
```json
{
    "_comentario": "Configuracion general de la instalación de archlinux, por el momento solo tenemos esta configuración",
    "general":{
        "usuario": {
            "nombre": "lemon",
            "contrausuario": "12345"
        },
        "hostname": {
            "nombre": "arch",
            "contraroot": "54321"
        },
        "disco": "/dev/sda",
        "particion": {
            "_comentario": "Instalador detectara si tu sistema es efi o boot, razon por la cual estan ambas opciones",
            "swap": "2G",
            "root": "20G",
            "efi": "200M",
            "boot": "200M"
        },
        "idioma-teclado": {
            "_comentario": "Opciones pais(ejemplo: es_PA.UTF-8/panama), keymap(ejemplo: la-latin1, es, en)",
            "pais": "es_PA.UTF-8",
            "keymap": "la-latin1"
        },
        "DM": {
            "_comentario": "Opciones: lightdm, ly-git",
            "eleccion": "ly-git"
        },
        "WM": {
            "_comentario": "Opciones: qtile, bspwm",
            "eleccion": "qtile"
        },
        "GPU": {
            "_comentario": "Opciones: maquina-virtual, Nvidea, AMD, INTEL",
            "eleccion": "maquina-virtual"
        },
        "app-general": {
            "_comentario":"Opciones terminal(alacritty, rxvt-unicode), shell(zsh, fish), editor(vim, nano, gedit), Navegadores(brave-bin, firefox)",
            "terminal": "alacritty",
            "shell": "fish",
            "editor": "vim",
            "gestor-archivos": "thunar",
            "navegador": "brave-bin"
        },
        "aur-helper": {
            "_comentario": "Opciones: yay, octopi, todo, nada",
            "eleccion": "todo"
        },
        "utilidades": {
            "_comentario": "Opciones: True, False",
            "android": "True",
            "git": "True",
            "wget": "True",
            "neofetch": "True"
        },
        "extra": {
            "_comentario": "Opciones: True, False",
            "rofi": "True",
            "scrot": "True",
            "qview": "True",
            "pulseaudio": "True",
            "wifi": "True",
            "Bluetuuu": "True"
        },
        "dev": {
            "_comentario": "Opciones: True, False",
            "gcc": "True",
            "cmake": "True",
            "anaconda": "True"
        }
    }
}
```
### Instalación
```sh
loadkeys es
pacman -Sy git jq
git clone https://github.com/Fuhrerh-Lemon/ArchLemon.git
cd ArchLemon
sh ArchLemon.sh
```
#### Colaborador
<code><img height="30" src="https://avatars3.githubusercontent.com/u/50478769?s=400&v=4"></code>
[HewelFo](https://www.github.com/HewelFo)
