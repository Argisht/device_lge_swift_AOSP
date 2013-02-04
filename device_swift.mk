# Put en_US first in the list, to make it default.
PRODUCT_LOCALES := ru_RU mdpi

$(call inherit-product, build/target/product/full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Extra DS overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/swift/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
	liblgdrm \
	brcm_patchram_plus \
	libmm-omxcore \
	libOmxCore \
	bdaddr_read \
	libril \
	gps.swift \
	gralloc.swift \
	copybit.swift \
	sensors.swift \
	SVGBrowserPlugin \
	Flash_lite \
	libcyanogen-dsp \
	FileManager \
	FireWall \
	lights.swift \
	libFFTEm \

PRODUCT_PACKAGES += \
	Launcher2 \
	AndroidTerm \
	Pacman \
	openvpn \
	LatinIME \
	Provision \
	GoogleSearch \
	Stk \
	FM \
	hcitool \

PRODUCT_PACKAGES += flash_image dump_image erase_image e2fsck hostap libhostapdcli

# Live wallpaper packages
PRODUCT_PACKAGES += \
	LiveWallpapersPicker \
	librs_jni \
	LiveWallpapers \

TARGET_PREBUILT_KERNEL := device/lge/swift/prebuilt/kernel/zImage

PRODUCT_COPY_FILES := \
	$(TARGET_PREBUILT_KERNEL):kernel

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Board-specific init
PRODUCT_COPY_FILES += device/lge/swift/files/init.rc:root/init.rc
PRODUCT_COPY_FILES += device/lge/swift/files/init.swift.rc:root/init.swift.rc
PRODUCT_COPY_FILES += device/lge/swift/files/ueventd.rc:root/ueventd.rc
PRODUCT_COPY_FILES += device/lge/swift/files/initlogo.rle:root/initlogo.rle

# hosts
PRODUCT_COPY_FILES += device/lge/swift/files/hosts:system/etc/hosts

# OMX proprietaries
# use all present proprietary lib. Sorry I cant give you close sources from Qualcomm 
    PRODUCT_COPY_FILES += $(shell find device/lge/swift/proprietary/lib/omxlib -name '*.so' \
	-printf '%p:system/lib/%f ')

# Audio 
PRODUCT_COPY_FILES += \
	device/lge/swift/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
	device/lge/swift/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
	device/lge/swift/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
	device/lge/swift/proprietary/boot_audio.mp3:system/media/audio/ui/boot_audio.mp3 \
	device/lge/swift/prebuilt/bootanimation.zip:system/media/bootanimation.zip \

# Camera proprietaries
PRODUCT_COPY_FILES += \
	device/lge/swift/proprietary/lib/camera/liboemcamera.so:system/lib/liboemcamera.so \

# RIL
PRODUCT_COPY_FILES += \
	device/lge/swift/proprietary/lib/ril/libauth.so:system/lib/libauth.so \
	device/lge/swift/proprietary/lib/ril/libbcmwl.so:system/lib/libbcmwl.so \
	device/lge/swift/proprietary/lib/ril/libcm.so:system/lib/libcm.so \
	device/lge/swift/proprietary/lib/ril/libdiag.so:system/lib/libdiag.so \
	device/lge/swift/proprietary/lib/ril/libdll.so:system/lib/libdll.so \
	device/lge/swift/proprietary/lib/ril/libdsm.so:system/lib/libdsm.so \
	device/lge/swift/proprietary/lib/ril/libdss.so:system/lib/libdss.so \
	device/lge/swift/proprietary/lib/ril/libgsdi_exp.so:system/lib/libgsdi_exp.so \
	device/lge/swift/proprietary/lib/ril/libgstk_exp.so:system/lib/libgstk_exp.so \
	device/lge/swift/proprietary/lib/ril/libmmgsdilib.so:system/lib/libmmgsdilib.so \
	device/lge/swift/proprietary/lib/ril/libnv.so:system/lib/libnv.so \
	device/lge/swift/proprietary/lib/ril/liboem_rapi.so:system/lib/liboem_rapi.so \
	device/lge/swift/proprietary/lib/ril/liboncrpc.so:system/lib/liboncrpc.so \
	device/lge/swift/proprietary/lib/ril/libpbmlib.so:system/lib/libpbmlib.so \
	device/lge/swift/proprietary/lib/ril/libqmi.so:system/lib/libqmi.so \
	device/lge/swift/proprietary/lib/ril/libqueue.so:system/lib/libqueue.so \
	device/lge/swift/proprietary/lib/ril/libril_log.so:system/lib/libril_log.so \
	device/lge/swift/proprietary/lib/ril/libril-qc-1.so:system/lib/libril-qc-1.so \
	device/lge/swift/proprietary/lib/ril/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
	device/lge/swift/proprietary/lib/ril/libwms.so:system/lib/libwms.so \
	device/lge/swift/proprietary/lib/ril/libwmsts.so:system/lib/libwmsts.so \
	device/lge/swift/proprietary/lib/ril/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
	device/lge/swift/proprietary/lib/ril/liblgeat.so:system/lib/liblgeat.so \
	device/lge/swift/proprietary/lib/ril/liblgerft.so:system/lib/liblgerft.so \

PRODUCT_COPY_FILES += \
	device/lge/swift/proprietary/libmlFIFO.so:system/lib/libmlFIFO.so \

# LGE services
PRODUCT_COPY_FILES += \
	device/lge/swift/proprietary/qmuxd:system/bin/qmuxd \
	device/lge/swift/proprietary/akmd2:system/bin/akmd2 \
	device/lge/swift/proprietary/rild:system/bin/rild \
	device/lge/swift/proprietary/wl:system/bin/wl \
	device/lge/swift/proprietary/btld:system/bin/btld \
	device/lge/swift/proprietary/bcmtool:system/bin/bcmtool \
	device/lge/swift/proprietary/rft:system/bin/rft \
	device/lge/swift/proprietary/port-bridge:system/bin/port-bridge \
#	device/lge/swift/proprietary/wpa_supplicant:system/bin/wpa_supplicant \

# GPS
PRODUCT_COPY_FILES += \
	device/lge/swift/files/gps.conf:system/etc/gps.conf \
	device/lge/swift/proprietary/lib/gps/libcommondefs.so:system/lib/libcommondefs.so \
	device/lge/swift/proprietary/lib/gps/libgps.so:system/lib/libgps.so \
	device/lge/swift/proprietary/lib/gps/libloc_api.so:system/lib/libloc_api.so \
	device/lge/swift/proprietary/lib/gps/libloc-rpc.so:system/lib/libloc-rpc.so \
	device/lge/swift/proprietary/lib/gps/libloc.so:system/lib/libloc.so \
	device/lge/swift/proprietary/lib/gps/libloc.so:obj/lib/libloc.so \

# Bluetooth
PRODUCT_COPY_FILES += \
	device/lge/swift/proprietary/bluetooth/BCM4325D1_004.002.004.0262.0270.hcd:system/bin/BCM4325D1_004.002.004.0262.0270.hcd \

# Wifi
PRODUCT_COPY_FILES += \
	device/lge/swift/files/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
	device/lge/swift/files/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
	device/lge/swift/files/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
	device/lge/swift/files/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin \
	device/lge/swift/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/lge/swift/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \

# Flex
PRODUCT_COPY_FILES += \
	device/lge/swift/prebuilt/flex/flex.db:system/etc/flex/flex.db \
	device/lge/swift/prebuilt/flex/flex.xml:system/etc/flex/flex.xml \

PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/kernel/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

# Keylayouts
PRODUCT_COPY_FILES += \
	device/lge/swift/prebuilt/msm_touchscreen.kcm.bin:system/usr/keychars/msm_touchscreen.kcm.bin \
	device/lge/swift/prebuilt/keylayout/msm_touchscreen.kl:system/usr/keylayout/msm_touchscreen.kl \
	device/lge/swift/prebuilt/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/lge/swift/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/lge/swift/prebuilt/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	device/lge/swift/prebuilt/keylayout/7k_headset.kl:system/usr/keylayout/7k_headset.kl \

# SD Card
PRODUCT_COPY_FILES += \
	device/lge/swift/files/vold.fstab:/system/etc/vold.fstab \

# Hardware properties 
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# HW
#PRODUCT_COPY_FILES += \
#	device/lge/swift/proprietary/lib/lights.swift.so:system/lib/hw/lights.swift.so \

# OpenGL
PRODUCT_COPY_FILES += \
	device/lge/swift/files/egl.cfg:system/lib/egl/egl.cfg \
	device/lge/swift/prebuilt/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
	device/lge/swift/prebuilt/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
	device/lge/swift/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
	device/lge/swift/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
	device/lge/swift/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
	device/lge/swift/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
	device/lge/swift/proprietary/lib/egl/libgsl.so:system/lib/libgsl.so \

PRODUCT_PROPERTY_OVERRIDES += \
	windowsmgr.max_events_per_sec=150 \
	ro.tethering.kb_disconnect=1 \
	ro.ril.def.agps.mode=2 \
	ro.ril.def.agps.feature=1 \
	ro.media.dec.jpeg.memcap=10000000 \
	ro.config.notification_sound=09_Echo.ogg \
	ro.config.alarm_alert=01_Alarm_1.ogg \
	ro.config.ringtone=06_Rainbow.ogg \
	persist.sys.use_dithering=1 \
	persist.sys.use_16bpp_alpha=1 \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false

SWIFT_WITH_GOOGLE := true

ifdef SWIFT_WITH_GOOGLE

    # use all present proprietary apk
    PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/googleapps -name '*.apk' \
	-printf '%p:system/app/%f ')

    # use all present proprietary lib
    PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/googleapps -name '*.so' \
	-printf '%p:system/lib/%f ')

    # use all present proprietary jar
    PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/googleapps -name '*.jar' \
	-printf '%p:system/framework/%f ')

    # use all present proprietary xml (permissions)
    PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/googleapps -name '*.xml' \
	-printf '%p:system/etc/permissions/%f ')

    PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/audio/alarms -name '*.ogg' \
	-printf '%p:system/media/audio/alarms/%f ')

    PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/audio/notifications -name '*.ogg' \
	-printf '%p:system/media/audio/notifications/%f ')

    PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/audio/ringtones -name '*.ogg' \
	-printf '%p:system/media/audio/ringtones/%f ')

    PRODUCT_COPY_FILES += $(shell find device/lge/swift/prebuilt/audio/ui -name '*.ogg' \
	-printf '%p:system/media/audio/ui/%f ')

endif

PRODUCT_COPY_FILES += \
	device/lge/swift/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
	device/lge/swift/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
	device/lge/swift/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
	device/lge/swift/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
	device/lge/swift/prebuilt/common/etc/profile:system/etc/profile \
	device/lge/swift/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
	device/lge/swift/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
	device/lge/swift/prebuilt/common/bin/compcache:system/bin/compcache \
	device/lge/swift/prebuilt/common/bin/sysinit:system/bin/sysinit \

PRODUCT_COPY_FILES += \
	device/lge/swift/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
	device/lge/swift/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
	device/lge/swift/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
	device/lge/swift/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
	device/lge/swift/prebuilt/common/etc/init.d/09mountdl:system/etc/init.d/09mountdl \
	device/lge/swift/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
	device/lge/swift/prebuilt/common/etc/init.d/08mountext:system/etc/init.d/08mountext \

# GSM APN list
PRODUCT_COPY_FILES += \
    device/lge/swift/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/lge/swift/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := swift
PRODUCT_DEVICE := swift
PRODUCT_MODEL := GT540
