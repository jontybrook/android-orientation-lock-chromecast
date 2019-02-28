# Android Orientation Lock for Chromecast to Portrait screens.
by Jonty Brook - me@jontyb.co.uk

This script modifies environment properties to block automatic rotation on Android devices when casting. It enables mirroring the phone screen via cast for demonstration purposes. Without this patch, Chromecast is smart enough to put a portrait view of the screen in the center of a landscape TV as it presumes TV's will always be landscape. This makes life difficult if you want to mount a TV in portrait orientation.

This was written for the launch of the Google Pixel in order to demonstrate the phones on portrait screens over chromecast at events. This works on Pixel 1, 2 & 3 devices. Others have not been tested but should work. The 'patch' is not dangerous but you should proceed with caution if you need to unlock flashing on your device as this will likely wipe all data.

This repository contains a number of other handy scripts for configuring Pixel phones for demo casts eg setting the resolution.

This "patch" isn't really a patch. It simply sets the following Android OS props:

`config.override_forced_orient true`
`persist.demo.remoterotation portrait`
`persist.demo.hdmirotation portrait`

## Prerequisites

- Ensure you have ADB and Fastboot installed on your computer.
- The device you are modifying must either be running a developer/debug Android build, or must have bootloader flashing unlocked.
- CAUTION! UNLOCKING FLASHING ON YOUR DEVICE WILL WIPE ALL DATA! PROCEED WITH CAUTION IF USING A PRODUCTION BUILD
- IF you are not using this on a Google Pixel 3, you should modify the script to boot the relevant version of TWRP for your device.

# Getting Started

This configuration can be applied on both development and production Android builds. The most suitable method depends on your situation:

- I am running a development / debug Android build: To apply the properties required, ADB must be able to run adbd as root. To test this, plug in your device and run "adb root". If you get "ADB cannot run as root in production builds" then you need the next option. If you can run ADB as root, you can simply run the "apply-props-portrait-cast.sh" script.

- I am running a production Android build: If the device you want to configure is running a production build of Android (most are!) then the process is more involved. You must run the "run-castconfigure.sh" script which walks through the process.

## Other scripts

- tools/checkpatch.sh - Checks if the cast rotation patch has been previously applied to this device.
- tools/apply-props-portrait-cast.sh - Applies the props if ADBD can run as root.
- tools/resolution-set-pixel3.sh - Sets the resolution of Pixel 3 devices to match a 1080p 16:9 screen aspect ratio.
- tools/resolution-set-pixel3xl.sh - Sets the resolution of Pixel 3 XL devices to match a 1080p 16:9 screen aspect ratio.
- unlock.sh - Assists with unlocking flashing on devices.

## Support

If you need help, feel free to contact me on me@jontyb.co.uk
