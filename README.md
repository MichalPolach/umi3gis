# WARNING: Readme/Instructions is currently work in progress as well as the actual Script it self! It can brick your installation so proceed with caution on your own risk.

# umi3gis
*Ubuntu Minimal i3-gaps Installation Script*

## Info
This "thing" - *rice, desktop, environment* - whatever you might call it, is kind of a bunch of commands and useful programs sew-together in order to "easily" (implementation may vary) setup **i3-gaps** window manager on a clean, (quite) minimal Ubuntu installation.

## Instructions
The instalation script has been created to work with minimal Ubuntu installation.

And by "Minimal Installation" I mean something different than the option you are presented
with during the standard Ubuntu installation.

Specifically, through following link below you have to download the `.iso` image and make bootable media from it.
link to download the `.iso` - https://help.ubuntu.com/community/Installation/MinimalCD

**OR** - it is also possible to use Ubuntu Server installation.
The point is to have only the basic functionality without the additional unnecessary "bloat" - command line and basic networking!

If you know some `BASH` and scripting, you should be able to read through the installation script and understand what it is trying
to do.

And of course by all means, customize it how ever you like!

For those who lacks those skills might found the following lines useful.

## Instructions for newbies
After you have succesfully installed and loged in to your Minimal Ubuntu system, GIT has to be installed (suprisingly...).
This done by simple command:
```
sudo apt install git
```
Then download the installation script from this repo:
```
$ git clone https://github.com/MichalPolach/umi3gis.git
```
This will download the `umi3gis` directory containing the installation script.

Next it is important to make the script actually executable, so we could actually **run** the script.
Issue following command to accomplish this:
```
$ cd umi3gis
$ sudo chmod +x umi3gis.sh
```
Now you can finally run the installation script and it will do the "magick" - some minor input needed here and there.
