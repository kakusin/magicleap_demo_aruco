# Generated Makefile -- DO NOT EDIT!

CC=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1/tools/toolchains/bin/aarch64-linux-android-clang
COMPILER_PREFIX=
CXX=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1/tools/toolchains/bin/aarch64-linux-android-clang++
HOST=win64
LINKER_PREFIX=
MLSDK=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1
MyArUco_BASE=C:/Users/s-mak/Documents/Projects/MyArUco
MyArUco_CPPFLAGS=-I$(MyArUco_BASE)/inc/ -I$(MLSDK)/include
MyArUco_CXXFLAGS=--sysroot=$(MLSDK)/lumin -march=armv8-a -mcpu=cortex-a57+crypto -fPIC -fpic -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -Wa,--noexecstack -Wformat -Werror=format-security -Wno-invalid-command-line-argument -Wno-unused-command-line-argument -g -fno-limit-debug-info -O0 -std=c++11 -nostdinc++ -I$(MLSDK)/lumin/stl/libc++/include -fdiagnostics-format=msvc
MyArUco_LDFLAGS=-Wl,-unresolved-symbols=ignore-in-shared-libs --sysroot=$(MLSDK)/lumin -Wl,--warn-shared-textrel -Wl,--fatal-warnings -Wl,--build-id -no-canonical-prefixes -Wl,--no-undefined -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,--enable-new-dtags '-Wl,-rpath=$$ORIGIN' -g -L$(MLSDK)/lumin/stl/libc++/lib
MyArUco_LIBS=-L$(MLSDK)/lib/lumin -Wl,--start-group -Bdynamic -lc -lc++_shared -landroid_support -lml_graphics -lml_perception_client -lml_input -lml_lifecycle -lml_ext_logging -lEGL -lGLESv2 -lGLESv3 -lm -Wl,--end-group
MyArUco_OUTPUT=$(MyArUco_BASE)/.out/$(SPEC)
OBJCOPY=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1/tools/toolchains/bin/aarch64-linux-android-objcopy.exe
RM=rm
SPEC=debug_lumin_clang-3.8_aarch64
STRIP=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1/tools/toolchains/bin/aarch64-linux-android-strip.exe

$(MyArUco_OUTPUT)/libMyArUco.so : $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o $(MyArUco_BASE)/MyArUco.mabu $(MLSDK)/.metadata/components/ml_sdk.comp $(MLSDK)/.metadata/components/ml_sdk_common.comp $(MLSDK)/tools/mabu/data/components/OpenGL.comp $(MLSDK)/tools/mabu/data/configs/debug.config $(MLSDK)/tools/mabu/data/options/debug/on.option $(MLSDK)/tools/mabu/data/options/magicleap.option $(MLSDK)/tools/mabu/data/options/optimize/off.option $(MLSDK)/tools/mabu/data/options/package/debuggable/on.option $(MLSDK)/tools/mabu/data/options/runtime/shared.option $(MLSDK)/tools/mabu/data/options/standard-c++/11.option $(MLSDK)/tools/mabu/data/options/stl/libc++.option $(MLSDK)/tools/mabu/data/options/warn/on.option
	$(INFO) \[MyArUco\]\ Linking\ shared\ object\ 'libMyArUco.so'...
	$(ECHO) cd $(MyArUco_OUTPUT) && $(LINKER_PREFIX) $(CC) -o libMyArUco.so -shared obj.MyArUco/src/MyArUco.cpp.o $(MyArUco_LIBS) $(MyArUco_LDFLAGS)
	$(ECHO) $(OBJCOPY) --only-keep-debug $(MyArUco_OUTPUT)/libMyArUco.so $(MyArUco_OUTPUT)/libMyArUco.sym
	$(ECHO) $(OBJCOPY) --add-gnu-debuglink $(MyArUco_OUTPUT)/libMyArUco.sym $(MyArUco_OUTPUT)/libMyArUco.so $(MyArUco_OUTPUT)/libMyArUco.so
	$(ECHO) $(STRIP) --strip-unneeded $(MyArUco_OUTPUT)/libMyArUco.so

$(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o : $(MyArUco_BASE)/src/MyArUco.cpp $(MyArUco_BASE)/MyArUco.mabu $(MLSDK)/.metadata/components/ml_sdk.comp $(MLSDK)/.metadata/components/ml_sdk_common.comp $(MLSDK)/tools/mabu/data/components/OpenGL.comp $(MLSDK)/tools/mabu/data/configs/debug.config $(MLSDK)/tools/mabu/data/options/debug/on.option $(MLSDK)/tools/mabu/data/options/magicleap.option $(MLSDK)/tools/mabu/data/options/optimize/off.option $(MLSDK)/tools/mabu/data/options/package/debuggable/on.option $(MLSDK)/tools/mabu/data/options/runtime/shared.option $(MLSDK)/tools/mabu/data/options/standard-c++/11.option $(MLSDK)/tools/mabu/data/options/stl/libc++.option $(MLSDK)/tools/mabu/data/options/warn/on.option
	$(INFO) \[MyArUco\]\ Compiling\ 'MyArUco.cpp'...
	$(ECHO) $(COMPILER_PREFIX) $(CXX) -c $(MyArUco_BASE)/src/MyArUco.cpp -o $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o -MD -MP -MF $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.d $(MyArUco_CPPFLAGS) $(MyArUco_CXXFLAGS)
	$(ECHO) echo $(MyArUco_BASE)/src/MyArUco.cpp : >> $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.d

-include $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.d

MyArUco-clean :: 
	$(INFO) Cleaning\ MyArUco...
	$(ECHO) $(RM) -rf $(MyArUco_OUTPUT)/libMyArUco.so $(MyArUco_OUTPUT)/MyArUco.sym $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.d $(MyArUco_OUTPUT)/bin/libc++_shared.so

MyArUco-all :: -make-directories $(MyArUco_OUTPUT)/libMyArUco.so

