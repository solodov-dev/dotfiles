---
title: Xinit config
author: Andrey Solodov
tangle: ~/.xinitrc or /etc/lemurs/wms/awesome
---

# Xinitrc config for starting X server.
You can tangle this file to ~/.xinitrc or if you use something like lemurs to 
/etc/lemurs/wms/awesome

```sh
#!/bin/sh 
```
##  Auto-mount usb disks
```sh
udiskie &
```

## Auto manage screen brightness (turn your web-cam into a light sensor)
```sh
clight &
```

## Start awesome WM
```sh
exec awesome
```
