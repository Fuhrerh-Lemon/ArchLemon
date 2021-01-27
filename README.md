# ArchLemon  
## **Indíce**
- [Configuración](#Configuraci%C3%B3n)
- [Instalación](#Instalaci%C3%B3n)
- [Colaborador](#Colaborador)
### Configuración
Puedes cambiar los valores en config.json
```json
{
    "autores": "FuhrerhLemon, Hewel ochoa",
    "_comentario": "Configuración general de la instalación de archlinux, por el momento solo tenemos está configuración",
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
            "_comentario": "Instalador detectara si tu sistema es efi o boot, razón por la cual estan ambas opciones",
            "swap": "2G",
            "root": "20G",
            "efi": "200M",
            "boot": "200M"
        },
        "idioma-teclado": {
            "_comentario": "Opciones: país(ejemplo: es_PA.UTF-8/panama), keymap(ejemplo: la-latin1, es, en)",
            "pais": "es_PA.UTF-8",
            "keymap": "la-latin1"
        },
        "DM": {
            "_comentario": "Opciones: lightdm, ly-git",
            "dm": "ly-git"
        },
        "WM": {
            "_comentario": "Opciones: qtile, bspwm, awesome",
            "wm": "awesome"
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
            "navegador": "brave-bin"
        },
        "aur-helper": {
            "_comentario": "Opciones: yay, octopi, todo, nada",
            "eleccion": "todo"
        },
        "utilidades": {
            "_comentario": "Opciones: true, fale",
            "android": false,
            "git": true,
            "wget": true,
            "neofetch": false
        },
        "extra": {
            "_comentario": "Opciones: true, fale",
            "rofi": true,
            "scrot": true,
            "qview": false,
            "pulseaudio": false,
            "waifai": false,
            "Bluetuuu": false
        },
        "dev": {
            "_comentario": "Opciones: true, fale",
            "gcc": true,
            "cmake": true,
            "anaconda": false
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
