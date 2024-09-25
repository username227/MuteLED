# MuteLED

This repository contains a simple script that provides a workaround for some HP models where the mute LED light does not function. This is more of a hacky workaround solution. I've tested on my HP laptop, HP Pavilion Gaming Laptop 15z-ec0. It might work on other models. 

# Instructions:

First, check and see if the following command will turn on your mute LED:
```
sudo hda-verb /dev/snd/hwC1D0 0x20 0x500 0x0B && sudo hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7778
```
and that this command turns off your LED:
```
sudo hda-verb /dev/snd/hwC1D0 0x20 0x500 0x0B && sudo hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7774
```

If this works, then you should be able to use this hack.

If you are on Arch or an Arch-derivative, you can install through the AUR, or download the package from releases.

Otherwise, place the files as follows:
```
/usr/bin/muteled
/etc/acpi/actions/muteled.sh
/etc/acpi/events/mute-led
```
Dependencies: alsa-tools, pamixer, acpid
