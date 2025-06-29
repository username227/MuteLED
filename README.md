# MuteLED

This repository contains a simple script that provides a workaround for some HP laptop models where the mute LED light does not function. This is more of a hacky workaround solution. Models for which MuteLED is reported to work and not work are listed in [this](https://github.com/username227/MuteLED/wiki/Support-by-Laptop-Model) wiki article. The article will be updated as more users report results. Therefore, if you find that this solution works for your laptop model, please comment in [Issue #1](https://github.com/username227/MuteLED/issues/1) with your laptop model and any pertient information. If the script does NOT work for you, please see below. Thanks.

# Instructions:

First, check and see if the following command will turn on your mute LED:<p>
<code>sudo hda-verb /dev/snd/_cardnumber_ 0x20 0x500 0x0B && sudo hda-verb /dev/snd/_cardnumber_ 0x20 0x400 0x7778</code>

and that this command turns off your LED:<p>
<code>sudo hda-verb /dev/snd/_cardnumber_ 0x20 0x500 0x0B && sudo hda-verb /dev/snd/_cardnumber_ 0x20 0x400 0x7774</code><p>
Replace _cardnumber_ with your audio card number, usually one of three values: hwC0D0, hwC1D0, or hwC2D0. To find the correct card number, run the following command:<p>
<code>grep "Speaker Playback Volume" /proc/asound/card*/codec*</code>.<p>
The output will have a path that should say card0, card1, or card2. If you use card0,  use hwC0D0, and so on.

If these commands work to turn on and off your LED, this module should work by default.
### Important:
If the above commands do not work, then don't give up. Please visit [this wiki page](https://github.com/username227/MuteLED/wiki/Get-Support-For-Your-Laptop-Model) where several other sets of commands known to work on other HP laptop models are listed. If any set of commands from that wiki page work, follow the instructions in the article to open a new issue with the Request LED Support template and I will try to incorporate support for your laptop model as quickly as possible.

### Installation:
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
