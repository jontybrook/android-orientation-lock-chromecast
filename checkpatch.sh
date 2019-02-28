# Authoor: me@jontyb.co.uk
if adb shell getprop | grep -q 'persist.demo.hdmirotation'; then
   echo "SUCCESS - Patch was applied."
fi
if ! adb shell getprop | grep -q 'persist.demo.hdmirotation'; then
   echo "NOT APPLIED"
fi
