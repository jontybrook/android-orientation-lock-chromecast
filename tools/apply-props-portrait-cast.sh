# If you're using a developer build or have root on the phone, use this script.
echo "Getting root on device..."
adb root
echo "Setting property: config.override_forced_orient true..."
adb shell setprop config.override_forced_orient true
echo "Resetting wm size..."
adb shell wm size reset
echo "Setting property: persist.demo.remoterotation portrait..."
adb shell setprop persist.demo.remoterotation portrait
echo "Setting property: persist.demo.hdmirotation portrait..."
adb shell setprop persist.demo.hdmirotation portrait
echo "Done!"
echo "by Jonty Brook -  me@jontyb.co.uk"
