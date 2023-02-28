TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SwiftHooker

SwiftHooker_FILES = Tweak.x BHHook.swift
SwiftHooker_EXTRA_FRAMEWORKS = Runtime
SwiftHooker_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
