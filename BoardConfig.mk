#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/lancelot
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Inherit from mt6768-common
-include device/xiaomi/mt6768-common/BoardConfigCommon.mk

# Asserts
TARGET_OTA_ASSERT_DEVICE := lancelot,galahad,shiva

# Display
TARGET_SCREEN_DENSITY := 440

# HIDL
ODM_MANIFEST_SKUS += \
    galahad

ODM_MANIFEST_GALAHAD_FILES := $(DEVICE_PATH)/manifest_galahad.xml

# Kernel
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_CONFIG := defconfig
TARGET_PREBUILT_KERNEL := $(KERNEL_PATH)/Image.gz
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/headers
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(BOARD_PREBUILT_DTBIMAGE_DIR)/mt6768.dtb

# Inherit the proprietary files
include vendor/xiaomi/lancelot/BoardConfigVendor.mk
