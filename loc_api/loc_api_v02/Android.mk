LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libloc_api_v02
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional

ifeq ($(TARGET_DEVICE),apq8026_lw)
LOCAL_CFLAGS += -DPDK_FEATURE_SET
else ifeq ($(BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET),true)
LOCAL_CFLAGS += -DPDK_FEATURE_SET
endif

LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    libloc_core \
    libgps.utils \
    libdl \
    libloc_ds_api \
    liblog \
    libloc_loader

LOCAL_SRC_FILES = \
    LocApiV02.cpp \
    loc_api_v02_log.c \
    loc_api_v02_client.c \
    loc_api_sync_req.c \
    location_service_v02.c

LOCAL_CFLAGS += \
    -fno-short-enums \
    -D_ANDROID_

## Includes
LOCAL_C_INCLUDES := \

LOCAL_HEADER_LIBRARIES := \
    libloc_core_headers \
    libgps.utils_headers \
    libloc_ds_api_headers \
    libloc_pla_headers \
    liblocation_api_headers
LOCAL_CFLAGS += $(GNSS_CFLAGS)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libloc_api_v02_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
include $(BUILD_HEADER_LIBRARY)
