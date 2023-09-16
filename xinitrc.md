---
title: Xinit config
author: Andrey Solodov
tangle: /etc/lemurs/wms/awesome or ~/.xinitrc
---

# Xinitrc config for starting X server.
You can tangle this file to ~/.xinitrc or if you use something like lemurs to 
/etc/lemurs/wms/awesome

!!! DON"T FORGET TO MAKE /etc/lemurs/wms/awesome EXECUTABLE !!!

```sh
#!/bin/sh 
```
Auto-mount usb disks
```sh
udiskie &
```
Start awesome WM
```sh
exec awesome
```
