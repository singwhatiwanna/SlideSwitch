NDK_DEBUG_MODE=0
APP_PLATFORM=android-9
TARGET_ARCH_ABI=armeabi-v7a
NDK_TOOLCHAIN=arm-linux-androideabi-4.4.3
STRIP=arm-linux-androideabi-strip.exe -s
args=NDK_TOOLCHAIN=$(NDK_TOOLCHAIN) APP_PLATFORM=$(APP_PLATFORM) NDK_DEBUG=$(NDK_DEBUG_MODE) TARGET_ARCH_ABI=$(TARGET_ARCH_ABI)

all: clean wd23 wd40 wd41
	cp -f obj/local/armeabi-v7a/*.so libs/armeabi-v7a/
	echo finished build wonderplayer

hello:
	cd jni;ndk-build $(args) ANDROID_OS=2.2;cd ..
	$(STRIP) obj/local/armeabi-v7a/libhello-jni.so
	#mkdir -p ./libs/armeabi-v7a/
	echo finished build hello
	
wd23:
	cd jni;ndk-build $(args) ANDROID_OS=2.3;cd ..
	$(STRIP) obj/local/armeabi-v7a/libhenoplayer-23.so
	mkdir -p ./libs/armeabi-v7a/
	cp -f jni/deps/ffmpeg/lib/libffmpeg.so libs/armeabi-v7a/
	cp -f jni/deps/ffmpeg/lib/libffmpeg_sw.so libs/armeabi-v7a/

wd40:
	cd jni;ndk-build $(args) ANDROID_OS=4.0;cd ..
	$(STRIP) obj/local/armeabi-v7a/libhenoplayer-40.so
	mkdir -p ./libs/armeabi-v7a/
	cp -f jni/deps/ffmpeg/lib/libffmpeg.so libs/armeabi-v7a/
	cp -f jni/deps/ffmpeg/lib/libffmpeg_sw.so libs/armeabi-v7a/

wd41:
	cd jni;ndk-build $(args) ANDROID_OS=4.1;cd ..
	$(STRIP) obj/local/armeabi-v7a/libhenoplayer-41.so
	mkdir -p ./libs/armeabi-v7a/
	cp -f jni/deps/ffmpeg/lib/libffmpeg.so libs/armeabi-v7a/
	cp -f jni/deps/ffmpeg/lib/libffmpeg_sw.so libs/armeabi-v7a/

clean:
	rm -rf libs/*
	rm -rf obj
	rm -rf bin/*.apk
	
	 
