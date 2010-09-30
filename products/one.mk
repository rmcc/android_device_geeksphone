#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS := device/geeksphone/geeksphone-one/overlay

$(call inherit-product, build/target/product/generic.mk)

# This is the list of apps to include in the build
PRODUCT_PACKAGES := \
    AlarmProvider \
    ApplicationsProvider \
    Browser \
    Calculator \
    Calendar \
    CalendarProvider \
    Camera \
    Contacts \
    ContactsProvider \
    DeskClock \
    DownloadProvider \
    DrmProvider \
    Email \
    FileManager \
    Gallery \
    GlobalSearch \
    GoogleSearch \
    HTMLViewer \
    LatinIME \
    Launcher2 \
    MediaProvider \
    Mms \
    Music \
    PackageInstaller \
    Phone \
    PicoTts \
    Provision \
    Settings \
    SettingsProvider \
    SpareParts \
    SoundRecorder \
    SubscribedFeedsProvider \
    Sync \
    SyncProvider \
    TelephonyProvider \
    TtsService \
    UserDictionaryProvider \
    VoiceDialer \
    VpnServices \
    WebSearchProvider \
    Stk \
    framework-res \
    GlobalTime \
    QuickSearchBox \
    Bluetooth \
    AccountAndSyncSettings \
    NotePad \
    Superuser \
    CertInstaller \
    LiveWallpapersPicker \
    LiveWallpapers \
    Protips \
    RCUpdater \
    libRS \
    librs_jni

## Binaries

PRODUCT_PACKAGES += \
    ssh \
    scp \
    hcidump \
    hciconfig \
    hcitool \
    openvpn \
    flash_image \
    tcpdump \
    rzscontrol \
    sqlite3

TINY_TOOLBOX:=true

# This is the list of locales included in AOSP builds
PRODUCT_LOCALES := en_US en_GB fr_FR it_IT de_DE es_ES pt_PT ru_RU

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true
PRODUCT_NAME := geeksphone_one
PRODUCT_BRAND := geeksphone
PRODUCT_MANUFACTURER := FIH
PRODUCT_DEVICE := geeksphone-one

# The user-visible product name
PRODUCT_MODEL := Geeksphone ONE

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-fih \
    ro.com.google.clientidbase.yt=android-fih \
    ro.com.google.clientidbase.am=android-fih \
    ro.com.google.clientidbase.vs=android-fih \
    ro.com.google.clientidbase.gmm=android-fih \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1 \
    ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.mode=OPTIONAL \
	ro.com.android.dateformat=dd-MM-yyyy \
	ro.com.android.dataroaming=true 

# Configuration
#
PRODUCT_COPY_FILES += \
	device/geeksphone/geeksphone-one/gps.conf:system/etc/gps.conf \
	device/geeksphone/geeksphone-one/apns-conf.xml:system/etc/apns-conf.xml \
	device/geeksphone/geeksphone-one/spn-conf.xml:system/etc/spn-conf.xml \
	device/geeksphone/geeksphone-one/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/geeksphone/geeksphone-one/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Scripts and packages
PRODUCT_COPY_FILES += \
    device/geeksphone/geeksphone-one/prebuilt/openvpn-up.sh:system/xbin/openvpn-up.sh \
    device/geeksphone/geeksphone-one/prebuilt/compcache:system/xbin/compcache \
    device/geeksphone/geeksphone-one/prebuilt/backuptool.sh:system/bin/backuptool.sh \
    device/geeksphone/geeksphone-one/prebuilt/bootanimation.zip:system/media/bootanimation.zip \
    device/geeksphone/geeksphone-one/prebuilt/Tether.apk:system/app/Tether.apk \
    device/geeksphone/geeksphone-one/prebuilt/WaveSecure.apk:system/app/WaveSecure.apk


## Libraries and proprietary binaries
PRODUCT_COPY_FILES += \
	device/geeksphone/geeksphone-one/proprietary/data.patch.hw2_0.bin:system/etc/wifi/fw/data.patch.hw2_0.bin \
	device/geeksphone/geeksphone-one/proprietary/eeprom.bin:system/etc/wifi/fw/eeprom.bin \
	device/geeksphone/geeksphone-one/proprietary/athwlan.bin.z77:system/etc/wifi/fw/athwlan.bin.z77 \
	device/geeksphone/geeksphone-one/proprietary/libgps.so:obj/lib/libgps.so \
	device/geeksphone/geeksphone-one/proprietary/libgps.so:system/lib/libgps.so \
	device/geeksphone/geeksphone-one/proprietary/hci_qcomm_init:system/bin/hci_qcomm_init


# Pick up some sounds
include frameworks/base/data/sounds/AudioPackage4.mk
