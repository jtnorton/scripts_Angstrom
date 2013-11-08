!#/bin/bash
# This script is courtesy of HipsterCircuits....it takes the .dtbo and compiles it with the capemanager

# If you have a BeagleBone Black, you can compile firmware for device tree overlays without installing squat:

dtc -O dtb -o enable-uart5-00A0.dtbo -b 0 -@ enable-uart5.dts

# You should now have a file named enable-uart5-00A0.dtbo.
# Copy that file into the firmware directory:

cp enable-uart5-00A0.dtbo /lib/firmware/


# Then enable the overlay:
echo enable-uart5 > /sys/devices/bone_capemgr.*/slots

#You should now have a file in /dev called ttyO4. You can try to listen to it by catting it:
cat /dev/ttyO4


#Or you can send something to it:
echo test > /dev/ttyO4

#If you do not have the file /dev/ttyO4, check the kernel log:

dmesg

#To check and make sure the pins have been muxed correctly, check the listings in the pin groups:

cat /sys/kernel/debug/pinctrl/44e10800.pinmux/pingroups

#You should see a pin group for uart5.