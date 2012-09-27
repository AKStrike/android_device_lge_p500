$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/p500/p500-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p500/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/p500/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PROPERTY_OVERRIDES := \
    ro.media.dec.jpeg.memcap=10000000

# Some more stuff:
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true \
    persist.sys.scrollingcache=2
    net.bt.name=Android-GingerDX

## Extra Cyanogen vendor files
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# GingerDX files
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/gingerdx/GalleryDX.apk:/system/app/GalleryDX.apk \
    vendor/cyanogen/prebuilt/common/gingerdx/HoloLauncher.apk:/system/app/HoloLauncher.apk \
    vendor/cyanogen/prebuilt/common/gingerdx/GPSCountryOptimizer.apk:/system/app/GPSCountryOptimizer.apk \
    vendor/cyanogen/prebuilt/common/gingerdx/libqpicjni88.so:/system/lib/libqpicjni88.so \
    vendor/cyanogen/prebuilt/common/gingerdx/ESFileExplorer.apk:/system/app/ESFileExplorer.apk \
    vendor/cyanogen/prebuilt/common/gingerdx/gps.conf:/system/etc/ \
    vendor/cyanogen/prebuilt/common/xbin/zipalign:system/xbin/zipalign \
    vendor/cyanogen/prebuilt/common/gingerdx/ICSandwich.apk:system/app/ICSandwich.apk 



## SuperSU
PRODUCT_COPY_FILES += \
	vendor/cyanogen/prebuilt/common/gingerdx/SuperSU.apk:system/app/SuperSU.apk \
	vendor/cyanogen/prebuilt/common/xbin/su:system/xbin/su 


## Gapps
PRODUCT_COPY_FILES += \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/FOTAKill.apk:system/app/FOTAKill.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/Gmail.apk:system/app/Gmail.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/MarketUpdater.apk:system/app/MarketUpdater.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/MediaUploader.apk:system/app/MediaUploader.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/NetworkLocation.apk:system/app/NetworkLocation.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/SetupWizard.apk:system/app/SetupWizard.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/Talk.apk:system/app/Talk.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/app/Vending.apk:system/app/Vending.apk \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/etc/permissions/features.xml:system/etc/permissions/features.xml \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/lib/libtalk_jni.so:system/lib/libtalk_jni.so \
	vendor/cyanogen/prebuilt/common/gingerdx/gapps/lib/libvoicesearch.so:system/lib/libvoicesearch.so

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/initlogo.rle:root/initlogo.rle \
    $(LOCAL_PATH)/init.thunderg.rc:root/init.thunderg.rc \
    $(LOCAL_PATH)/ueventd.thunderg.rc:root/ueventd.thunder.rc

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvram.txt:system/etc/wl/nvram.txt \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko

# chargermode
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    $(LOCAL_PATH)/chargemode/chargerlogo:root/sbin/chargerlogo

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

PRODUCT_PACKAGES += \
    gps.p500 \
    lights.p500 \
    hwaddrs \
    copybit.msm7k \
    libOmxCore \
    libcamera \
    lgapversion

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := p500
PRODUCT_DEVICE := p500
PRODUCT_MODEL := LG Optimus One
