@echo off
echo Plug in your device with a USB data cable.
echo Please enable ADB debuging in the developer options (Tap Serial Number in Device Options 20 times if it is hidden)
echo and unlock your device to the homescreen. This script will root your device.
echo make sure all adb and fastboot drivers are installed if you have problems.
echo ACCEPT THE PROMPT ON YOUR DEVICE TO ALLOW USB DEBUGGING!
echo Press ENTER when you have followed the above steps.
pause
adb wait-for-device
adb reboot-bootloader
fastboot oem append-cmdline "androidboot.unlocked_kernel=true"
fastboot continue
echo Do not disconnect the device.
adb wait-for-device
adb remount
adb push libsupol.so /data/local/tmp/
adb push root_fire.sh /data/local/tmp/
adb push su /data/local/tmp/
adb push Superuser.apk /data/local/tmp/
adb push supolicy /data/local/tmp/
adb shell chmod 777 /data/local/tmp/root_fire.sh
adb shell /data/local/tmp/root_fire.sh
fastboot oem append-cmdline "androidboot.unlocked_kernel=true"
fastboot continue
echo Do not disconnect the device. Optimizing system storage and aplications...
adb wait-for-device
echo Root commands executed!
echo DISABLING OTA UPDATES!!!
echo AMAZON WILL PROBABLY FOREVER BREAK ROOT IN FUTURE UPDATES IF THESE WERE LEFT ENABLED!!
echo If you would like to update in the future, enter recovery mode and ADB sideload the update.bin provided by amazons website.
adb remount +rw /system
adb shell rm -r /system/etc/security/otacerts.zip
adb shell rm -r /system/priv-app/DeviceSoftwareOTA/
adb shell rm -r /system/app/otaverifier
echo Fastboot rebooting...
fastboot oem append-cmdline "androidboot.unlocked_kernel=true"
fastboot continue
echo Optimizing system storage and applications...
echo Do not disconnect the device.
adb wait-for-device
echo Remounting /system as rewritable...
adb remount +rw /system
echo Debloating...
echo Deleting AdvertisingIdSettings
adb shell rm -r /system/priv-app/AdvertisingIdSettings
echo Deleting Special Offers (Amazon Advert Spam)
adb shell rm -r /system/priv-app/com.amazon.kindle.kso-1
adb shell rm -r /data/app/com.amazon.kindle.kso-1
echo Deleting Amazon GameCircle
adb shell rm -r /system/priv-app/com.amazon.ags.app
echo Deleting Amazon GoodReads Share
adb shell rm -r /system/priv-app/com.amazon.unifiedsharegoodreads
echo Deleting Retail Demo
adb shell rm -r /system/priv-app/com.amazon.kor.demo
echo Deleting Amazon Recess
adb shell rm -r /system/priv-app/FireRecessProxy
echo Deleting Audible
adb shell rm -r /system/priv-app/com.audible.application.kindle
echo Deleting Audiobooks store...
adb shell rm -r /system/priv-app/com.audible.application.store


