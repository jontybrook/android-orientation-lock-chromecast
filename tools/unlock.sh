# Author: me@jontyb.co.uk
# Helps with unlocking Pixel devices...
echo "Device status:"
fastboot getvar unlocked
read -rsp $'Press enter to continue...\n'
echo "## !!!! IF YOU CONTINUE, THE DEVICE WILL FIRST BE UNLOCKED."
echo "## !!!! THIS WILL RESULT IN ALL PERSONAL DATA ON THE DEVICE BEING DELETED."
echo "## !!!! ALL DATA WILL BE DELETED. PROCEED WITH CAUTION."
read -rsp $'Press enter to continue or press ctrl + C to cancel...\n'
echo "Unlocking the device..."
fastboot flashing unlock
echo "YOU MUST NOW PRESS THE VOLUME UP KEY, AND POWER BUTTON, TO CONFIRM THE UNLOCK".
read -rsp $'Press enter after completing the unlock on-device...\n'
echo "Device status:"
fastboot getvar unlocked
echo "Done. Now press Start on device."
