# Generated Makefile -- DO NOT EDIT!

HOST=win64
MyArUco_BASE=C:/Users/s-mak/Documents/Projects/MyArUco
MyArUco_OUTPUT=$(MyArUco_BASE)/.out/$(SPEC)
SPEC=release_lumin_clang-3.8_aarch64


# this turns off the suffix rules built into make
.SUFFIXES:

# this turns off the RCS / SCCS implicit rules of GNU Make
% : RCS/%,v
% : RCS/%
% : %,v
% : s.%
% : SCCS/s.%

# If a rule fails, delete $@.
.DELETE_ON_ERROR:

ifeq ($(VERBOSE),)
ECHO=@
else
ECHO=
endif

ifeq ($(QUIET),)
INFO=@echo
else
INFO=@:
endif

ifeq ($(VERBOSE),)
SPAM=@: \#
else
SPAM=@echo
endif

all : prebuild build postbuild

prebuild :: 

postbuild :: 

clean :: MyArUco-clean

$(MLSDK)/tools/mabu/data/components/OpenGL.comp : 

$(MLSDK)/.metadata/components/ml_sdk_common.comp : 

$(MLSDK)/tools/mabu/data/configs/release.config : 

$(MLSDK)/tools/mabu/data/options/warn/on.option : 

$(MLSDK)/.metadata/components/ml_sdk.comp : 

$(MLSDK)/tools/mabu/data/options/stl/libc++.option : 

$(MLSDK)/tools/mabu/data/options/standard-c++/11.option : 

$(MLSDK)/tools/mabu/data/options/debug/on.option : 

$(MLSDK)/tools/mabu/data/options/runtime/shared.option : 

$(MLSDK)/tools/mabu/data/options/magicleap.option : 

$(MLSDK)/tools/mabu/data/options/optimize/on.option : 

$(MLSDK)/tools/mabu/data/options/package/debuggable/off.option : 

PROGRAM_PREFIX=
PROGRAM_EXT=
SHARED_PREFIX=lib
SHARED_EXT=.so
IMPLIB_PREFIX=lib
IMPLIB_EXT=.so
STATIC_PREFIX=lib
STATIC_EXT=.a
COMPILER_PREFIX=
LINKER_PREFIX=

-make-directories : C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64 C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64/bin C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64/obj.MyArUco/src

C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64 : 
	$(ECHO) @mkdir -p C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64

C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64/bin : 
	$(ECHO) @mkdir -p C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64/bin

C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64/obj.MyArUco/src : 
	$(ECHO) @mkdir -p C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_lumin_clang-3.8_aarch64/obj.MyArUco/src

include $(MyArUco_OUTPUT)/MyArUco.mk
build :  | MyArUco-all

