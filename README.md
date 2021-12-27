# About
Small script to set some defaults for the default Linux Image on the RG552.
* Enables the Theme Downloader
* Changes the Hotkeys to the 351ELEC defaults:
   * [SELECT]+ [START] x 2 = Exit Retroarch
   * [SELECT]+(A) = Pause
   * [SELECT]+(B) = Screenshot
   * [SELECT]+(X) = Enter Retroarch menu
   * [SELECT]+(Y) = Toggle FPS
   * [SELECT]+[L1] = Load last state
   * [SELECT]+[R1] = Save state
   * [SELECT]+[L2] = Rewind (if rewind is enabled)
   * [SELECT]+[R2] = Toggels Fast Forward (if enabled)
   * [L3]+[R3] = Enter Retroarch menu
* Sets the defaults for handhelds, Arcade and Atari2600 to Square Pixel and Integer Scaling
* Enable the LCD3 Shader for all handhelds
* Sets the *GB - POCKET* colourization for GB/GBC
* Sets the default for all other systems to 4:3 and integer scaling
* Enables *Sync to exact Content Framerate* for all systems except N64
* Sets *SaveRAM Autosave Interval* to 10 seconds to ensure the savestates a written to the card in case of system failure.

# Installation
## Easy setup
* download `settings.sh`
* create a ports folder in your Games partition and place the script there
* Rescan the Games on the device
* Start *settings* from the Ports Section
* The changes will apply, and the device will shut down. After you power it on again, the new settings are enabled.

## Using ssh
You can also place the settings.sh script somewhere on the device ans start it on the command line.

# Changelog
2021-12-27: First release on GitHub
