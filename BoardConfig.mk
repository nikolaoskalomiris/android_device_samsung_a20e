#
# Copyright (C) 2020 The LineageOS Project
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

DEVICE_PATH := device/samsung/a20e

BUILD_TOP := $(shell pwd)

# Board
TARGET_BOARD_NAME := SRPSB12A003

# Platform
BOARD_VENDOR := samsung
TARGET_SOC := exynos7885
TARGET_BOOTLOADER_BOARD_NAME := universal7885
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOARD_PLATFORM_GPU := mali-g71
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# 64bit build
TARGET_SUPPORTS_64_BIT_APPS := true

# Kernel
BOARD_BOOT_HEADER_VERSION := 1
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_CMDLINE := androidboot.hardware=exynos7884B androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board $(TARGET_BOARD_NAME)
TARGET_KERNEL_ADDITIONAL_FLAGS := SEC_BUILD_OPTION_VTS=true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/samsung/universal7885
TARGET_KERNEL_CONFIG := lineage-17.1_defconfig
TARGET_KERNEL_CLANG_COMPILE := true

# AUDIO
USE_XML_AUDIO_POLICY_CONF := 1
TARGET_AUDIOHAL_VARIANT := samsung

# Android Verified Boot
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_SAMSUNG_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(DEVICE_PATH)/bluetooth/libbt_vndcfg.tx

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/hidl/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/hidl/compatibility_matrix.xml

# Wifi
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Enable 64-bits binder
TARGET_USES_64_BIT_BINDER := true

# Graphics
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_USES_EXYNOS5_COMMON_GRALLOC := true
TARGET_USES_HWC2 := true

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := a20e

# Partition Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE     := 37748736
BOARD_DTBOIMG_PARTITION_SIZE       := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 55574528
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 4404019200
BOARD_CACHEIMAGE_PARTITION_SIZE    := 419430400
# Reserve space for data encryption (-20480)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 24943505408
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# TREBLE: Build a seperate vendor.img
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE   := 545259520
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VNDK_VERSION := current

# Filesystem
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Root
BOARD_ROOT_EXTRA_FOLDERS := efs omr

# Ril
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
BOARD_SEPOLICY_VERS := 29.0
BOARD_SEPOLICY_TEE_FLAVOR := teegris
include device/lineage/sepolicy/exynos/sepolicy.mk
include device/samsung_slsi/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

# System-as-root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Vendor Security Patch
VENDOR_SECURITY_PATCH := 2020-09-01

# Lineage hardware
BOARD_HARDWARE_CLASS := \
    hardware/samsung/lineagehw

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888

# DEX Pre-optimization
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true
  endif
endif

# Inherit from the proprietary version
-include vendor/samsung/a20e/BoardConfigVendor.mk
