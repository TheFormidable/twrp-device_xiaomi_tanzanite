#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += system boot vbmeta_system odm_dlkm product vbmeta_vendor vendor_dlkm system_ext vendor_boot vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier \
    update_engine_sideload

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libpuresoftkeymasterdevice \
    android.hardware.keymaster@4.1 \
    libkeymint

# Security
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1 \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.vibrator-V1-ndk_platform.so \

TW_LOAD_VENDOR_MODULES := "flashlight.ko flashlights-mt6789-o7.ko"

# Vendor ramdisk
PRODUCT_COPY_FILES += \
     device/xiaomi/tanzanite/fstab.mt6789:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6789

