#!/bin/bash
#
# Set default to the same settings as 351ELEC
#

CONSOLES="amiga1200 amiga500 amigacd32 amigacdtv amstradcpc atari5200 atari7800 atari800 atarist \
	  atomiswave c128 c20 c64 cannonball cavestory channelf colecovision daphne devilutionx dos \
	  dreamcast easyrpg fds gameandwatch gx4000 intellivision lutro mastersystem \
	  megadrive mrboom msx1 msx2+ msx2 msxturbor n64 naomi neogeo neogeocd nes odyssey2 openbor \
	  pc88 pc98 pcengine pcenginecd pet pico8 pokemini prboom psx satellaview saturn scummvm \
	  sdlpop sega32x segacd sg1000 snes solarus sufami supergrafx thomson tic80 tyrquake vectrex \
	  virtualboy x1 x68000 xash3d_fwgs zx81 zxspectrum"
SQUARE="atari2600 fbneo mame"
HANDHELD="gb gb2players gba gbc gbc2players gamegear lynx ngp ngpc psp wswan wswanc"

echo "Kill Emulationstation"
killall emulationstation
sleep 1

echo "Configurion Hotkey Settings"
/usr/bin/anbernic-settings -a -w global.retroarch.input_enable_hotkey_btn -v 8
/usr/bin/anbernic-settings -a -w global.retroarch.input_menu_toggle_gamepad_combo -v 2
/usr/bin/anbernic-settings -a -w global.retroarch.input_quit_gamepad_combo -v 4
/usr/bin/anbernic-settings -a -w global.retroarch.quit_press_twice -v 'true'
/usr/bin/anbernic-settings -a -w global.retroarch.input_screenshot_btn -v 0
/usr/bin/anbernic-settings -a -w global.retroarch.input_fps_toggle_btn -v 3
/usr/bin/anbernic-settings -a -w global.retroarch.input_pause_toggle_btn -v 1
/usr/bin/anbernic-settings -a -w global.retroarch.input_menu_toggle_btn -v 2
/usr/bin/anbernic-settings -a -w global.retroarch.input_toggle_fast_forward_btn -v 7
/usr/bin/anbernic-settings -a -w global.retroarch.input_rewind_btn -v 6

echo "Video Sync enable for some systems"
/usr/bin/anbernic-settings -a -w global.retroarch.vrr_runloop_enable -v 'true'
/usr/bin/anbernic-settings -a -w n64.retroarch.vrr_runloop_enable -v 'false'

echo "Enable save interval"
/usr/bin/anbernic-settings -a -w global.retroarch.autosave_interval -v 10

echo "Configuring Game Defaults"
/usr/bin/anbernic-settings -a -w global.ratio -v '3/4'
/usr/bin/anbernic-settings -a -w global.integerscale -v 1

for system in ${SQUARE} ${HANDHELD}; do
	/usr/bin/anbernic-settings -a -w ${system}.ratio -v 'squarepixel'
done

for system in ${HANDHELD}; do
    /usr/bin/anbernic-settings -a -w ${system}-renderer.shader -v 'handheld/lcd3x'
done

echo "Set Colors for GB(C)"
/usr/bin/anbernic-settings -a -w gb-renderer.colorization -v 'GB - Pocket'
/usr/bin/anbernic-settings -a -w gbc-renderer.colorization -v 'GB - Pocket'

echo "Enable Theme Downloader"
sed -i 's/updates.anbernic.org/updates.batocera.org/g' /usr/bin/anbernic-es-theme
sync
/usr/bin/anbernic-save-overlay

echo "Switching OFF to take effect"
sync
sleep 1
halt
