LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LIBGLES_MALI_LIBRARY := /vendor/lib/egl/libGLES_mali.so

LIBOPENCL_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libOpenCL.so
$(LIBOPENCL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libOpenCL.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf libOpenCL.so.1 $@

LIBOPENCL1_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libOpenCL.so.1
$(LIBOPENCL1_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libOpenCL.so.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf libOpenCL.so.1.1 $@

LIBOPENCL11_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libOpenCL.so.1.1
$(LIBOPENCL11_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libOpenCL.so.1.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MALI_LIBRARY) $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(LIBOPENCL_SYMLINK) \
	$(LIBOPENCL1_SYMLINK) \
	$(LIBOPENCL11_SYMLINK)

LIBGLES_MALI_LIBRARY_64 := /vendor/lib64/egl/libGLES_mali.so

LIBOPENCL_SYMLINK_64 := $(TARGET_OUT_VENDOR)/lib64/libOpenCL.so
$(LIBOPENCL_SYMLINK_64): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/libOpenCL.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf libOpenCL.so.1 $@

LIBOPENCL1_SYMLINK_64 := $(TARGET_OUT_VENDOR)/lib64/libOpenCL.so.1
$(LIBOPENCL1_SYMLINK_64): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/libOpenCL.so.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf libOpenCL.so.1.1 $@

LIBOPENCL11_SYMLINK_64 := $(TARGET_OUT_VENDOR)/lib64/libOpenCL.so.1.1
$(LIBOPENCL11_SYMLINK_64): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/libOpenCL.so.1.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MALI_LIBRARY_64) $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(LIBOPENCL_SYMLINK_64) \
	$(LIBOPENCL1_SYMLINK_64) \
	$(LIBOPENCL11_SYMLINK_64)
