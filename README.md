# MuteLED

This repository contains a simple script that provides a workaround for some HP laptop models where the mute LED light does not function. This is more of a hacky workaround solution. Models for which MuteLED is reported to work and not work are listed in [this](https://github.com/username227/MuteLED/wiki/Support-by-Laptop-Model) wiki article. The article will be updated as more users report results. Therefore, if you find that this solution works for your laptop model, or if it doesn't work, please comment in [Issue #1](https://github.com/username227/MuteLED/issues/1) with your laptop model and any pertient information. Thanks.

# Instructions:

First, check and see if the following command will turn on your mute LED:
```
sudo hda-verb /dev/snd/hwC1D0 0x20 0x500 0x0B && sudo hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7778
```
and that this command turns off your LED:
```
sudo hda-verb /dev/snd/hwC1D0 0x20 0x500 0x0B && sudo hda-verb /dev/snd/hwC1D0 0x20 0x400 0x7774
```

If the previous commands didn't work, try this:
To turn on the mute LED:
```
sudo hda-verb /dev/snd/hwC2D0 0x20 0x500 0x0b && sudo hda-verb /dev/snd/hwC2D0 0x20 0x400 0x8
```
To turn off the mute LED:
```
sudo hda-verb /dev/snd/hwC2D0 0x20 0x500 0x0b && sudo hda-verb /dev/snd/hwC2D0 0x20 0x400 0x0
```
Or, try this set of commands:
To turn on the mute LED:
```
sudo hda-verb /dev/snd/hwC0D0 0x20 0x500 0x0b && sudo hda-verb /dev/snd/hwC0D0 0x20 0x400 0x8
```
To turn off the mute LED:
```
sudo hda-verb /dev/snd/hwC2D0 0x20 0x500 0x0b && sudo hda-verb /dev/snd/hwC2D0 0x20 0x400 0x0
```
If any of these 3 sets of commands works, then you should be able to use this hack. HOWEVER: If the first set of commands works, this script should work automatically. If the second or third set of commands works, then the script will not work automatically, and you will need to comment in [Issue #1](https://github.com/username227/MuteLED/issues/1) or in a new issue with your model number so that the script can be updated to include your model.

If you are on Arch or an Arch-derivative, you can install through the AUR [here](https://aur.archlinux.org/packages/muteled), or download the package from releases. I have also included a deb file for debian-based distros (but I haven't tested it, so let me know if you run into issues).

Otherwise, place the files as follows:
```
/usr/bin/muteled
/etc/acpi/actions/muteled.sh
/etc/acpi/events/mute-led
```
The first two files should have execute rights (755).

Then, make sure that the acpid service is started:
```
sudo systemctl enable --now acpid.service
```

Dependencies: alsa-tools, pamixer, acpid
