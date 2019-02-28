# Authoor: me@jontyb.co.uk
# Prevent Auto-rotation when casting with Android devices.
# This script configures Android devices for casting to a screen in portrait orientation.
# The device must have flashing unlocked. This script boots the device into TWRP to allow modifying props with root access.
echo "Author: me@jontyb.co.uk"
echo "ANDROID CASTING ROTATION LOCK"
echo "This script is for production builds which do not allow adbd to run as root."
echo "Before running this script, ensure the device has USB Debugging enabled and flashing unlocked."
echo "Also ensure you have ADB and Fastboot installed on your computer."
echo "-------------------"
echo "## Plug the device in now."
echo "## If prompted, allow USB debugging."
read -rsp $'Press enter to continue...\n'
if adb shell getprop | grep -q 'persist.demo.hdmirotation'; then
   echo "## !!!! LOOKS LIKE THE PATCH WAS ALREADY APPLIED TO THIS device!"
fi
echo "Rebooting to Bootloader..."
adb reboot bootloader
echo "## The device is now restarting."
echo "## Wait for the device to boot into bootloader screen before continuing."
read -rsp $'Press enter to continue...\n'
echo "Booting TWRP on target device..."
fastboot boot includes/twrp-3.2.3-3-crosshatch.img
## TODO Error if flashing unlock is not allowed: flashing unlock is not allowed
#fastboot boot includes/twrp-3.2.3-3-crosshatch.img
## TODO If fail - error message includes FAILED. Full message: FAILED (remote: 'Fastboot command (boot) is not allowed when locked')
echo "## The device will now reboot into TWRP. Once it has loaded, swipe the slider to enable changes on the device before continuing."
read -rsp $'Press enter to continue...\n'
echo "Applying props..."
echo "Getting root on device..."
# adb root # Root already obtained with TWRP
# TODO error if premature: no devices/emulators found
echo "Setting property: config.override_forced_orient true..."
adb shell setprop config.override_forced_orient true
echo "Setting property: persist.demo.remoterotation portrait..."
adb shell setprop persist.demo.remoterotation portrait
echo "Setting property: persist.demo.hdmirotation portrait..."
adb shell setprop persist.demo.hdmirotation portrait
echo "## Done applying props."
read -rsp $'Press enter to reboot the device...\n'
echo "Rebooting target..."
adb shell reboot
echo "## The target device will now be rebooting. Unlock it when it has booted."
read -rsp $'Press enter to continue...\n'
echo "Checking that the patch was successful..."
if adb shell getprop | grep -q 'persist.demo.hdmirotation'; then
   echo "SUCCESS!"
fi
if ! adb shell getprop | grep -q 'persist.demo.hdmirotation'; then
   echo "FAILED :("
fi
echo "Done"
