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

$(call inherit-product, build/target/product/generic.mk)

# This is the list of apps to include in the build
PRODUCT_PACKAGES := \
    AlarmClock \
    AlarmProvider \
    ApplicationsProvider \
    Browser \
    Bugreport \
    Calculator \
    Calendar \
    CalendarProvider \
    Camera \
    Contacts \
    ContactsProvider \
    DownloadProvider \
    DrmProvider \
    Email \
    FieldTest \
    GlobalSearch \
    GoogleSearch \
    HTMLViewer \
    LatinIME \
    Launcher \
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
    Updater \
    UserDictionaryProvider \
    VoiceDialer \
    VpnServices \
    WebSearchProvider \
    Stk \
    framework-res \
    GlobalTime \
    NotePad

# This is the list of locales included in AOSP builds
PRODUCT_LOCALES := en_US en_GB fr_FR it_IT de_DE es_ES pt_PT ru_RU

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true
PRODUCT_NAME := geeksphone_one
PRODUCT_BRAND := geeksphone
PRODUCT_MANUFACTURER := commtiva
PRODUCT_DEVICE := geeksphone-one

# The user-visible product name
PRODUCT_MODEL := Geeksphone ONE

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.dateformat=dd-MM-yyyy \
	ro.com.android.dataroaming=true 

PRODUCT_COPY_FILES += \
	vendor/geeksphone/geeksphone-one/gps.conf:system/etc/gps.conf \
	vendor/geeksphone/geeksphone-one/apns-conf.xml:system/etc/apns-conf.xml


# Pick up some sounds
include frameworks/base/data/sounds/OriginalAudio.mk
