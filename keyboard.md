---
title: Keyboard config
author: Andrey Solodov
tangle: /etc/X11/xorg.conf.d/80-thinkpad-kbd.conf
---

# Keyboard config for X11 server
Set capslock to ctrl, layouts to English and Russian and toggle layouts with Ctrl+Space
```
Section "InputClass"
    Identifier "keyboard defaults"
    MatchIsKeyboard "on"
    Option "XKbOptions" "ctrl:nocaps,grp:ctrl_space_toggle"
    Option "XKbLayout" "us,ru"
EndSection
```
