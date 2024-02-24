PACKAGE_VERSION = 1.0.3
ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
    TARGET = iphone:clang:latest:14.0
    ARCHS = arm64 arm64e
else
    TARGET = iphone:clang:latest:7.0
endif

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SmoothKB
$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
