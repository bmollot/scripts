mkdir /system/app/SuperSU
chmod 0755 /system/app/SuperSU
chcon u:object_r:system_file:s0 /system/app/SuperSU

cp /data/local/tmp/Superuser.apk /system/app/SuperSU/SuperSU.apk
chmod 0644 /system/app/SuperSU/SuperSU.apk
chcon u:object_r:system_file:s0 /system/app/SuperSU/SuperSU.apk

mkdir /system/bin/.ext
chmod 0755 /system/bin/.ext
chcon u:object_r:system_file:s0 /system/bin/.ext

cp /data/local/tmp/su /system/xbin/su
chmod 0755 /system/xbin/su
chcon u:object_r:system_file:s0 /system/xbin/su

cp /data/local/tmp/su /system/bin/.ext/.su
chmod 0755 /system/bin/.ext/.su
chcon u:object_r:system_file:s0 /system/bin/.ext/.su

cp /data/local/tmp/su /system/xbin/daemonsu
chmod 0755 /system/xbin/daemonsu
chcon u:object_r:system_file:s0 /system/xbin/daemonsu

cp /data/local/tmp/su /system/xbin/sugote
chmod 0755 /system/xbin/sugote
chcon u:object_r:zygote_exec:s0 /system/xbin/sugote

cp /data/local/tmp/supolicy /system/xbin/supolicy
chmod 0755 /system/xbin/supolicy
chcon u:object_r:system_file:s0 /system/xbin/supolicy

cp /data/local/tmp/libsupol.so /system/lib/libsupol.so
chmod 0644 /system/lib/libsupol.so
chcon u:object_r:system_file:s0 /system/lib/libsupol.so

cp /system/bin/sh /system/xbin/sugote-mksh
chmod 0755 /system/xbin/sugote-mksh
chcon u:object_r:system_file:s0 /system/xbin/sugote-mksh

cp /system/bin/app_process32 /system/bin/app_process32_original
chmod 0755 /system/bin/app_process32_original
chcon u:object_r:zygote_exec:s0 /system/bin/app_process32_original

cp /system/bin/app_process32 /system/bin/app_process_init
chmod 0755 /system/bin/app_process_init
chcon u:object_r:system_file:s0 /system/bin/app_process_init

rm /system/bin/app_process
rm /system/bin/app_process32

ln -s /system/xbin/daemonsu /system/bin/app_process
ln -s /system/xbin/daemonsu /system/bin/app_process32

touch /system/etc/.installed_su_daemon
chmod 0644 /system/etc/.installed_su_daemon
chcon u:object_r:system_file:s0 /system/etc/.installed_su_daemon

reboot bootloader
