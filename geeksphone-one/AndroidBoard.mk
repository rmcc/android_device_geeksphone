LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/cupcake-kernel
endif

## Keyboard maps

file := $(TARGET_OUT_KEYLAYOUT)/stmpe1601.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/stmpe1601.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/qwerty.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/qwerty.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/AVRCP.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/AVRCP.kl | $(ACP)
	$(transform-prebuilt-to-target)

## RIL from cupcake

file := $(TARGET_OUT)/lib/libril-qc-1.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libril-qc-1.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/liboem_rapi.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/liboem_rapi.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/liboncrpc.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/liboncrpc.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libmmgsdilib.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libmmgsdilib.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libgsdi_exp.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libgsdi_exp.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libgstk_exp.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libgstk_exp.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libwms.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libwms.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libnv.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libnv.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libwmsts.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libwmsts.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libdss.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libdss.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libqmi.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libqmi.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libsnd.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libsnd.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libdsm.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libdsm.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libqueue.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libqueue.so | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT)/lib/libcm.so
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/proprietary/libcm.so | $(ACP)
	$(transform-prebuilt-to-target)

## End of RIL

## Binary keychar maps

file := $(TARGET_OUT_KEYCHARS)/stmpe1601.kcm.bin
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/stmpe1601.kcm.bin | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYCHARS)/qwerty.kcm.bin
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/qwerty.kcm.bin | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYCHARS)/qwerty2.kcm.bin
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/qwerty2.kcm.bin | $(ACP)
	$(transform-prebuilt-to-target)
file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

# init files for boot.img
#
file := $(TARGET_ROOT_OUT)/init.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.one.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.qcom.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.qcom.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.qcom.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.qcom.sh | $(ACP)
	$(transform-prebuilt-to-target)


# This will install the file in /system/etc
#

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := vold.conf
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := data.patch.hw2_0.bin
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := athwlan.bin.z77
LOCAL_MODULE_TAGS := user
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := proprietary/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/compat-1.5/logfile:system/bin/logfile

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/compat-1.5/port-bridge:system/bin/port-bridge

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/compat-1.5/wpa_supplicant:system/bin/wpa_supplicant

## This is necessary if you want the magic auto-switch to c001 in
# the usb composite device... I don't care about it :)
# 
# Well... reimplemented anyway
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/proprietary/vold:system/bin/vold



### We need the old opencore to get video hardware accel...
#file := $(TARGET_OUT)/lib/libopencoreauthor.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencoreauthor.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencorecommon.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencorecommon.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencoredownloadreg.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencoredownloadreg.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencoredownload.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencoredownload.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencorehw.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencorehw.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencoremp4reg.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencoremp4reg.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencoremp4.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencoremp4.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencorenet_support.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencorenet_support.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencoreplayer.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencoreplayer.so | $(ACP)
#        $(transform-prebuilt-to-target)
#
#file := $(TARGET_OUT)/lib/libopencorertspreg.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencorertspreg.so | $(ACP)
#        $(transform-prebuilt-to-target)

#file := $(TARGET_OUT)/lib/libopencorertsp.so
#ALL_PREBUILT += $(file)
#$(file) : $(LOCAL_PATH)/opencore-old/libopencorertsp.so | $(ACP)
#        $(transform-prebuilt-to-target)


