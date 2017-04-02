@echo off
echo Plug in your device with a USB data cable.
echo Please enable ADB debuging in the developer options (Tap Serial Number in Device Options 20 times if it is hidden)
echo and unlock your device to the homescreen. This script will root your device.
echo make sure all adb and fastboot drivers are installed if you have problems.
echo ACCEPT THE PROMPT ON YOUR DEVICE TO ALLOW USB DEBUGGING!
echo MAKE SURE "ALWAYS ALLOW" IS CHECKED IF THE PROMPT SHOWS!
echo Press ENTER when you have followed the above steps.
pause
adb wait-for-device
echo Installing Google Play
adb install com.google.android.gms-6.6.03_(1681564-036)-6603036-minAPI9.apk
adb install GoogleLoginService.apk
adb install GoogleServicesFramework.apk
adb shell pm grant com.google.android.gms android.permission.INTERACT_ACROSS_USERS
adb install com.android.vending-5.9.12-80391200-minAPI9.apk
adb reboot-bootloader
echo Clearing Cache
adb shell rm -r /cache
echo Running exploit
fastboot oem append-cmdline "androidboot.unlocked_kernel=true"
fastboot continue
echo Do not disconnect the device.
echo Please wait...
echo If it hangs here, please accept the USB debugging prompt on your device.
adb wait-for-device
adb remount +rw /data
adb remount +rw /cache
adb shell rm -r /data/dalvik-cache
adb shell rm -r /cache
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
adb shell rm -r /system/priv-app/SystemUpdatesUI
adb shell rm -r /system/priv-app/com.amazon.dynamicupdationservice
echo Fastboot rebooting...
adb reboot-bootloader
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
echo If an error displaying "Not found" is shown, do not panic.
adb shell rm -r /system/priv-app/com.amazon.kindle.kso
adb shell rm -r /system/priv-app/com.amazon.kindle.kso-1
adb shell rm -r /data/app/com.amazon.kindle.kso-1
adb shell rm -r /data/app/com.amazon.kindle.kso
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
echo Deleting Audiobooks store
adb shell rm -r /system/priv-app/com.audible.application.store
echo Deleting Shop Amazon
adb shell rm -r /system/priv-app/com.amazon.windowshop
echo Deleting Shop Amazon
adb shell rm -r /system/priv-app/com.amazon.windowshop
echo Moving FreeTime to /data/app
adb shell mv /system/priv-app/com.amazon.tahoe /data/app
echo Deleting GoodReads
adb shell rm -r /system/priv-app/com.goodreads.kindle
echo Deleting Amazon Video
adb shell rm -r /system/priv-app/com.amazon.avod
echo Deleting Sina Webio Share
adb shell rm -r /system/priv-app/com.amazon.unifiedsharesinawebio
echo Removing WPS Office
adb shell rm -r /system/priv-app/moffice_7.1_default_en00105_multidex_217792
echo Replacing Launcher
adb shell rm -r /system/priv-app/com.amazon.firelauncher
adb push launcher.apk /system/priv-app
echo Installing Flash Player
echo Firefox may be needed for this to work.
adb push flashplayer.apk /system/priv-app
echo Pushing new build.prop
adb shell rm -r /system/build.prop
adb push build.prop /system
echo cleaning up from other script versions
adb shell rm -r /system/app/launcher.apk
echo Optimizing system storage and applications...
echo Re-securing device...
adb reboot
echo You may now disconnect your device.
pause

