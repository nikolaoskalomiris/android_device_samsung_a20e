LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LIBGLES_MALI_LIBRARY := /vendor/lib/egl/libGLES_mali.so

VULKAN_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/vulkan.universal7884B.so
$(VULKAN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/hw/vulkan.universal7884B.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MALI_LIBRARY) $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(VULKAN_SYMLINK)

LIBGLES_MALI_LIBRARY_64 := /vendor/lib64/egl/libGLES_mali.so

VULKAN_SYMLINK_64 := $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.universal7884B.so
$(VULKAN_SYMLINK_64): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/hw/vulkan.universal7884B.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MALI_LIBRARY_64) $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(VULKAN_SYMLINK_64)
