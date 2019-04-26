PACKAGE_VERSION = 1.0.1
ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SmoothKB
SmoothKB_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
