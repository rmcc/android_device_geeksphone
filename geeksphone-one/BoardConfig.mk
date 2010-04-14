# 
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := msm7k
TARGET_HARDWARE_3D := true
TARGET_BOOTLOADER_BOARD_NAME := qcom

BOARD_KERNEL_CMDLINE := mem=32M@0x1A000000 mem=21M@0x1C000000 mem=32M@0x20000000 mem=32M@0x22000000 mem=32M@0x24000000 mem=32M@0x26000000 console=ttyMSM2,115200n8 androidboot.hardware=qcom

#
TARGET_HARDWARE_3D := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
#TARGET_NO_RADIOIMAGE := false
TARGET_CPU_ABI := armeabi
#BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_INIT_RC := true


BOARD_GPS_LIBRARIES := libgps librpc
BUILD_LIBCAMERA := true
BOARD_CAMERA_LIBRARIES := libmmcamera libmmcamera-target
#USE_CAMERA_STUB:= true
#BUILD_OLD_LIBCAMERA:=true
BOARD_USES_QCOM_HARDWARE := true
BOARD_HAVE_BLUETOOTH := true

## We need the original supplicant to get the ar6k ioctls :(
#BOARD_WPA_SUPPLICANT_DRIVER:=WEXT
