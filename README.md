# How to use 

Clone the repo:
```bash
  git clone --recursive https://github.com/comodinoh/stuff
```

Then to setup the environment run:
```bash
  python env.py
```

and that's it.

# How to configure

If you want to add your own configurations and stuff in there,
simply add them in the MANIFEST file for them to be symlinked to your home.

For example let's say you have this MANIFEST file:
```
.emacs
.emacs.local
.config/nvim
.config/rofi
.config/polybar
.config/i3
.config/gtk-3.0
.config/qt5ct
.config/Kvantum
```
Let's say you also want to add your sway configuration to your environment as well,
simply copy your existing configuration to the stuff directory `cp -r ~/.config/sway/ ~/stuff/.config`.
Now add the new config in your MANIFEST:
```
.emacs
.emacs.local
.config/nvim
.config/rofi
.config/polybar
.config/i3
.config/gtk-3.0
.config/qt5ct
.config/Kvantum
.config/sway
```
Re-Setup your environment with `python env.py` and voila it will just work!

