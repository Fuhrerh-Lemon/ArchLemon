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
            "host": "arch",
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
        "GPU": {
            "_comentario": "Opciones: maquina-virtual, Nvidea, AMD, INTEL",
            "eleccion-gpu": "maquina-virtual"
        },
        "app-general": {
            "_comentario":"Opciones terminal(alacritty, rxvt-unicode, kitty), shell(zsh, fish), editor(vim, nano, gedit), Navegadores(brave-bin, firefox)",
            "terminal": "kitty",
            "shell": "fish",
            "editor": "neovim",
            "navegador": "firefox"
        },
        "DM": {
            "_comentario": "Opciones: true, false",
            "lightdm": true,
            "ly-git": false
        },
        "WM": {
            "_comentario": "Opciones: true, false",
            "awesome": false,
            "qtile": false,
            "bspwm": false,
            "xfce": true
        },
        "aur-helper": {
            "_comentario": "Opciones: true, false",
            "paru": true,
            "octopi": false
        },
        "utilidades": {
            "_comentario": "Opciones: true, fale",
            "android": false,
            "git": true,
            "wget": true
        },
        "extra": {
            "_comentario": "Opciones: true, fale",
            "rofi": true,
            "scrot": true,
            "pulseaudio": false,
            "waifai": false,
            "Bluetuuu": false
        },
        "dev": {
            "_comentario": "Opciones: true, fale",
            "gcc": true,
            "cmake": true
        }
    }
}
```
#### Colaborador
<code><img height="30" src="https://avatars3.githubusercontent.com/u/50478769?s=400&v=4"></code>
[HewelFo](https://www.github.com/HewelFo)
