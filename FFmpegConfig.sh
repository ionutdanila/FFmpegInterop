#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ "$1" == "Win10" ]; then
    echo "Make Win10"

    if [ "$2" == "x86" ]; then
        echo "Make Win10 x86"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows10/x86
        mkdir -p Output/Windows10/x86
        cd Output/Windows10/x86
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=x86 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
		--disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--enable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
        --prefix=../../../Build/Windows10/x86
        make install
        popd

    elif [ "$2" == "x64" ]; then
        echo "Make Win10 x64"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows10/x64
        mkdir -p Output/Windows10/x64
        cd Output/Windows10/x64
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=x86_64 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
		--disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--enable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
        --prefix=../../../Build/Windows10/x64
        make install
        popd

    elif [ "$2" == "ARM" ]; then
        echo "Make Win10 ARM"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows10/ARM
        mkdir -p Output/Windows10/ARM
        cd Output/Windows10/ARM
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=arm \
        --as=armasm \
        --cpu=armv7 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 -D__ARM_PCS_VFP" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
		--disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--enable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
        --prefix=../../../Build/Windows10/ARM
        make install
        popd
		
	 elif [ "$2" == "ARM64" ]; then
        echo "Make Win10 ARM64"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows10/ARM64
        mkdir -p Output/Windows10/ARM64
        cd Output/Windows10/ARM64
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=arm64 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 -D__ARM_PCS_VFP" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
		--disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--enable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
        --prefix=../../../Build/Windows10/ARM64
        make install
        popd

    fi

elif [ "$1" == "Win8.1" ]; then
    echo "Make Win8.1"

    if [ "$2" == "x86" ]; then
        echo "Make Win8.1 x86"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows8.1/x86
        mkdir -p Output/Windows8.1/x86
        cd Output/Windows8.1/x86
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=x86 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_PC_APP -D_WIN32_WINNT=0x0603" \
        --extra-ldflags="-APPCONTAINER" \
		--disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--disable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
        --prefix=../../../Build/Windows8.1/x86
        make install
        popd

    elif [ "$2" == "x64" ]; then
        echo "Make Win8.1 x64"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows8.1/x64
        mkdir -p Output/Windows8.1/x64
        cd Output/Windows8.1/x64
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=x86_64 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_PC_APP -D_WIN32_WINNT=0x0603" \
        --extra-ldflags="-APPCONTAINER" \
		--disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--disable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
        --prefix=../../../Build/Windows8.1/x64
        make install
        popd

    elif [ "$2" == "ARM" ]; then
        echo "Make Win8.1 ARM"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows8.1/ARM
        mkdir -p Output/Windows8.1/ARM
        cd Output/Windows8.1/ARM
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=arm \
        --as=armasm \
        --cpu=armv7 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_PC_APP -D_WIN32_WINNT=0x0603 -D__ARM_PCS_VFP" \
        --extra-ldflags="-APPCONTAINER -MACHINE:ARM" \
		--disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--disable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
        --prefix=../../../Build/Windows8.1/ARM
        make install
        popd

    fi

elif [ "$1" == "Phone8.1" ]; then
    echo "Make Phone8.1"

    if [ "$2" == "ARM" ]; then
        echo "Make Phone8.1 ARM"
        pushd $DIR/ffmpeg
        rm -rf Output/WindowsPhone8.1/ARM
        mkdir -p Output/WindowsPhone8.1/ARM
        cd Output/WindowsPhone8.1/ARM
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=arm \
        --as=armasm \
        --cpu=armv7 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_PHONE_APP -D_WIN32_WINNT=0x0603 -D__ARM_PCS_VFP" \
        --extra-ldflags="-APPCONTAINER -MACHINE:ARM -subsystem:console -opt:ref WindowsPhoneCore.lib RuntimeObject.lib PhoneAppModelHost.lib -NODEFAULTLIB:kernel32.lib -NODEFAULTLIB:ole32.lib" \
        --disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--disable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
		--prefix=../../../Build/WindowsPhone8.1/ARM
        make install
        popd

    elif [ "$2" == "x86" ]; then
        echo "Make Phone8.1 x86"
        pushd $DIR/ffmpeg
        rm -rf Output/WindowsPhone8.1/x86
        mkdir -p Output/WindowsPhone8.1/x86
        cd Output/WindowsPhone8.1/x86
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --arch=x86 \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_PHONE_APP -D_WIN32_WINNT=0x0603" \
        --extra-ldflags="-APPCONTAINER -subsystem:console -opt:ref WindowsPhoneCore.lib RuntimeObject.lib PhoneAppModelHost.lib -NODEFAULTLIB:kernel32.lib -NODEFAULTLIB:ole32.lib" \
		--disable-everything \
		--disable-debug \
		--enable-thumb \
        --enable-shared \
        --enable-cross-compile \
		--disable-d3d11va \
        --disable-dxva2 \
		--enable-small \
		--enable-network \
		--enable-runtime-cpudetect \
		--enable-decoder=mjpeg,mpeg4,mpegvideo,h264,flv,rawvideo,flashsv,flashsv2 \
		--enable-decoder=h264_dxva2,nellymoser,adpcm_swf,aac,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16le,pcm_s24be,pcm_s24le,pcm_s32be,pcm_s32le,pcm_s8,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8 \
		--enable-parser=mpeg4video,mpegaudio,mpegvideo,h261,h264 \
		--enable-demuxer=mpegvideo,h264,rtsp,flv,mjpeg,rawvideo,mpegts,rm,sdp,mpjpeg,h263 \
		--enable-protocol=http,tcp,udp \
		--enable-hwaccel=h264_dxva2,h264_d3d11va,h264_d3d11va2,h264_cuvid \
        --prefix=../../../Build/WindowsPhone8.1/x86
        make install
        popd

    fi

elif [ "$1" == "Win7" ]; then
    echo "Make Win7"

    if [ "$2" == "x86" ]; then
        echo "Make Win7 x86"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows7/x86
        mkdir -p Output/Windows7/x86
        cd Output/Windows7/x86
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=x86 \
        --enable-shared \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -D_WINDLL" \
        --extra-ldflags="-APPCONTAINER:NO -MACHINE:x86" \
        --prefix=../../../Build/Windows7/x86
        make install
        popd

    elif [ "$2" == "x64" ]; then
        echo "Make Win7 x64"
        pushd $DIR/ffmpeg
        rm -rf Output/Windows7/x64
        mkdir -p Output/Windows7/x64
        cd Output/Windows7/x64
        ../../../configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=amd64 \
        --enable-shared \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -D_WINDLL" \
        --extra-ldflags="-APPCONTAINER:NO -MACHINE:x64" \
        --prefix=../../../Build/Windows7/x64
        make install
        popd

    fi
fi

exit 0