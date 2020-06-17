# Generated Makefile -- DO NOT EDIT!

HOST=win64
MyArUco_BASE=C:/Users/s-mak/Documents/Projects/MyArUco
MyArUco_OUTPUT=$(MyArUco_BASE)/.out/$(SPEC)
SPEC=release_win_msvc-2017-15.9_x64


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

$(MLSDK)/tools/mabu/data/options/package/debuggable/off.option : 

$(MLSDK)/tools/mabu/data/components/OpenGL.comp : 

$(MLSDK)/.metadata/components/ml_sdk_common.comp : 

$(MLSDK)/tools/mabu/data/options/warn/on.option : 

$(MLSDK)/tools/mabu/data/options/debug/on.option : 

$(MLSDK)/tools/mabu/data/options/magicleap.option : 

$(MLSDK)/tools/mabu/data/options/stl/libgnustl.option : 

$(MLSDK)/tools/mabu/data/options/runtime/shared.option : 

$(MLSDK)/tools/mabu/data/options/standard-c++/11.option : 

$(MLSDK)/tools/mabu/data/options/optimize/on.option : 

$(MLSDK)/tools/mabu/data/configs/release.config : 

$(MLSDK)/.metadata/components/ml_sdk.comp : 

PROGRAM_PREFIX=
PROGRAM_EXT=.exe
SHARED_PREFIX=
SHARED_EXT=.dll
IMPLIB_PREFIX=
IMPLIB_EXT=.lib
STATIC_PREFIX=
STATIC_EXT=.lib
COMPILER_PREFIX=
LINKER_PREFIX=

-make-directories : C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_win_msvc-2017-15.9_x64 C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_win_msvc-2017-15.9_x64/obj.MyArUco/src

C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_win_msvc-2017-15.9_x64 : 
	$(ECHO) @mkdir -p C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_win_msvc-2017-15.9_x64

C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_win_msvc-2017-15.9_x64/obj.MyArUco/src : 
	$(ECHO) @mkdir -p C:/Users/s-mak/Documents/Projects/MyArUco/.out/release_win_msvc-2017-15.9_x64/obj.MyArUco/src

include $(MyArUco_OUTPUT)/MyArUco.mk
build :  | MyArUco-all

