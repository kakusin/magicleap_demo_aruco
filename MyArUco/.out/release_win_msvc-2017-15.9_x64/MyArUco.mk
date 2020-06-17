# Generated Makefile -- DO NOT EDIT!

COMPILER_PREFIX=
CXX=C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/bin/HostX86/x64/cl.exe
DEPGEN=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1/tools/mabu/tools/win/depgen.py
HOST=win64
LD=C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/bin/HostX86/x64/link.exe
LINKER_PREFIX=
LINKTOUCH=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1/tools/mabu/tools/win/linktouch.sh
MLSDK=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1
MyArUco_BASE=C:/Users/s-mak/Documents/Projects/MyArUco
MyArUco_CPPFLAGS=-I$(MyArUco_BASE)/inc/ -I$(MLSDK)/include -IC:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/ATLMFC/include -IC:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/include -IC:/Program\ Files\ \(x86\)/Windows\ Kits/NETFXSDK/4.6.1/include/um -IC:/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.17763.0/ucrt -IC:/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.17763.0/shared -IC:/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.17763.0/um -IC:/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.17763.0/winrt -IC:/Program\ Files\ \(x86\)/Windows\ Kits/10/include/10.0.17763.0/cppwinrt
MyArUco_CXXFLAGS=-Gm- -MD -ZI -W2 -O2 -Ot
MyArUco_LDFLAGS=-debug
MyArUco_LIBS=-libpath:$(MLSDK)/lib/win64 -libpath:C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/ATLMFC/lib/x64 -libpath:C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/VC/Tools/MSVC/14.16.27023/lib/x64 -libpath:C:/Program\ Files\ \(x86\)/Windows\ Kits/NETFXSDK/4.6.1/lib/um/x64 -libpath:C:/Program\ Files\ \(x86\)/Windows\ Kits/10/lib/10.0.17763.0/ucrt/x64 -libpath:C:/Program\ Files\ \(x86\)/Windows\ Kits/10/lib/10.0.17763.0/um/x64 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib ml_graphics.lib ml_perception_client.lib ml_input.lib ml_lifecycle.lib ml_ext_logging.lib OpenGL32.lib
MyArUco_OUTPUT=$(MyArUco_BASE)/.out/$(SPEC)
PYTHON=C:/Users/s-mak/MagicLeap/mlsdk/v0.24.1/tools/python3/python.exe
RM=rm
SPEC=release_win_msvc-2017-15.9_x64

$(MyArUco_OUTPUT)/MyArUco.dll : $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o $(MyArUco_BASE)/MyArUco.mabu $(MLSDK)/.metadata/components/ml_sdk.comp $(MLSDK)/.metadata/components/ml_sdk_common.comp $(MLSDK)/tools/mabu/data/components/OpenGL.comp $(MLSDK)/tools/mabu/data/configs/release.config $(MLSDK)/tools/mabu/data/options/debug/on.option $(MLSDK)/tools/mabu/data/options/magicleap.option $(MLSDK)/tools/mabu/data/options/optimize/on.option $(MLSDK)/tools/mabu/data/options/package/debuggable/off.option $(MLSDK)/tools/mabu/data/options/runtime/shared.option $(MLSDK)/tools/mabu/data/options/standard-c++/11.option $(MLSDK)/tools/mabu/data/options/stl/libgnustl.option $(MLSDK)/tools/mabu/data/options/warn/on.option
	$(INFO) \[MyArUco\]\ Linking\ DLL\ 'MyArUco.dll'...
	$(ECHO) cd $(MyArUco_OUTPUT) && $(LINKTOUCH) $(MyArUco_OUTPUT)/MyArUco.dll $(LINKER_PREFIX) $(LD) -nologo -out:MyArUco.dll -machine:x64 -dll obj.MyArUco/src/MyArUco.cpp.o $(MyArUco_LIBS) $(MyArUco_LDFLAGS)

$(MyArUco_OUTPUT)/MyArUco.lib : $(MyArUco_OUTPUT)/MyArUco.dll $(MyArUco_BASE)/MyArUco.mabu $(MLSDK)/.metadata/components/ml_sdk.comp $(MLSDK)/.metadata/components/ml_sdk_common.comp $(MLSDK)/tools/mabu/data/components/OpenGL.comp $(MLSDK)/tools/mabu/data/configs/release.config $(MLSDK)/tools/mabu/data/options/debug/on.option $(MLSDK)/tools/mabu/data/options/magicleap.option $(MLSDK)/tools/mabu/data/options/optimize/on.option $(MLSDK)/tools/mabu/data/options/package/debuggable/off.option $(MLSDK)/tools/mabu/data/options/runtime/shared.option $(MLSDK)/tools/mabu/data/options/standard-c++/11.option $(MLSDK)/tools/mabu/data/options/stl/libgnustl.option $(MLSDK)/tools/mabu/data/options/warn/on.option

$(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o : $(MyArUco_BASE)/src/MyArUco.cpp $(MyArUco_BASE)/MyArUco.mabu $(MLSDK)/.metadata/components/ml_sdk.comp $(MLSDK)/.metadata/components/ml_sdk_common.comp $(MLSDK)/tools/mabu/data/components/OpenGL.comp $(MLSDK)/tools/mabu/data/configs/release.config $(MLSDK)/tools/mabu/data/options/debug/on.option $(MLSDK)/tools/mabu/data/options/magicleap.option $(MLSDK)/tools/mabu/data/options/optimize/on.option $(MLSDK)/tools/mabu/data/options/package/debuggable/off.option $(MLSDK)/tools/mabu/data/options/runtime/shared.option $(MLSDK)/tools/mabu/data/options/standard-c++/11.option $(MLSDK)/tools/mabu/data/options/stl/libgnustl.option $(MLSDK)/tools/mabu/data/options/warn/on.option
	$(INFO) \[MyArUco\]\ Compiling\ 'MyArUco.cpp'...
	$(ECHO) $(PYTHON) $(DEPGEN) $(MyArUco_BASE)/src/MyArUco.cpp $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.d $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o -I$(MyArUco_BASE)/inc/ -I$(MLSDK)/include
	$(ECHO) $(COMPILER_PREFIX) $(CXX) -nologo -TP -c $(MyArUco_BASE)/src/MyArUco.cpp -Fo$(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o -FS -Fd$(MyArUco_OUTPUT)/MyArUco.pdb $(MyArUco_CPPFLAGS) $(MyArUco_CXXFLAGS)

-include $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.d
$(MyArUco_OUTPUT)/MyArUco.lib : $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o $(MyArUco_BASE)/MyArUco.mabu $(MLSDK)/.metadata/components/ml_sdk.comp $(MLSDK)/.metadata/components/ml_sdk_common.comp $(MLSDK)/tools/mabu/data/components/OpenGL.comp $(MLSDK)/tools/mabu/data/configs/release.config $(MLSDK)/tools/mabu/data/options/debug/on.option $(MLSDK)/tools/mabu/data/options/magicleap.option $(MLSDK)/tools/mabu/data/options/optimize/on.option $(MLSDK)/tools/mabu/data/options/package/debuggable/off.option $(MLSDK)/tools/mabu/data/options/runtime/shared.option $(MLSDK)/tools/mabu/data/options/standard-c++/11.option $(MLSDK)/tools/mabu/data/options/stl/libgnustl.option $(MLSDK)/tools/mabu/data/options/warn/on.option


MyArUco-clean :: 
	$(INFO) Cleaning\ MyArUco...
	$(ECHO) $(RM) -rf $(MyArUco_OUTPUT)/MyArUco.dll $(MyArUco_OUTPUT)/MyArUco.ilk $(MyArUco_OUTPUT)/MyArUco.idb $(MyArUco_OUTPUT)/MyArUco.pdb $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.o $(MyArUco_OUTPUT)/obj.MyArUco/src/MyArUco.cpp.d

MyArUco-all :: -make-directories $(MyArUco_OUTPUT)/MyArUco.dll

