#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd ffmpeg

make clean

echo $CFLAGS
echo $CROSS_PREFIX
echo $HOST

cp $2/gas-preprocessor.pl /usr/bin

./configure \
--target-os="$TARGET_OS" \
--cross-prefix="$CROSS_PREFIX" \
--host-cc="$CC" \
--cc="$CC" \
--cxx="$CXX" \
--as="$AS" \
--ar="$AR" \
--ld="$LD" \
--nm="$NM" \
--yasmexe="$YASMEXE" \
--arch="$NDK_ABI" \
--enable-cross-compile \
--enable-runtime-cpudetect \
--sysroot="$NDK_SYSROOT" \
--enable-pic \
--pkg-config="${2}/ffmpeg-pkg-config" \
--prefix="${2}/build/${1}" \
--extra-cflags="-I${TOOLCHAIN_PREFIX}/include $CFLAGS" \
--extra-ldflags="-L${TOOLCHAIN_PREFIX}/lib $LDFLAGS" \
--extra-libs="-lm" \
--extra-cxxflags="$CXX_FLAGS" \
\
--enable-version3 \
--enable-gpl \
\
\
--disable-doc \
\
--disable-libass \
--disable-libfreetype \
--disable-libfribidi \
\
--disable-decoders \
--disable-encoders \
--disable-muxers \
--disable-demuxers \
--disable-parsers \
--disable-protocols \
--disable-filters \
--disable-indevs \
--disable-outdevs \
--disable-avresample \
\
--enable-decoder=bmp \
--enable-decoder=gif \
--enable-decoder=png \
--enable-decoder=apng \
--enable-decoder=aac \
--enable-decoder=aac_at \
--enable-decoder=ac3 \
--enable-decoder=ac3_at \
--enable-decoder=mp1 \
--enable-decoder=mp1_at \
--enable-decoder=mp1float \
--enable-decoder=mp2 \
--enable-decoder=mp2_at \
--enable-decoder=mp2float \
--enable-decoder=mp3 \
--enable-decoder=mp3_at \
--enable-decoder=mp3adu \
--enable-decoder=mp3float \
--enable-decoder=mp3on4 \
--enable-decoder=mp3on4float \
--enable-decoder=mpeg1_cuvid \
--enable-decoder=mpeg1_vdpau \
--enable-decoder=mpeg1video \
--enable-decoder=mpeg2_crystalhd \
--enable-decoder=mpeg2_cuvid \
--enable-decoder=mpeg2_mmal \
--enable-decoder=mpeg2_qsv \
--enable-decoder=mpeg2video \
--enable-decoder=mpeg4 \
--enable-decoder=mpeg4_crystalhd \
--enable-decoder=mpeg4_cuvid \
--enable-decoder=mpeg4_mmal \
--enable-decoder=mpeg4_vdpau \
--enable-decoder=mpeg_vdpau \
--enable-decoder=mpeg_xvmc \
--enable-decoder=mpegvideo \
--enable-decoder=h264 \
--enable-decoder=h264_crystalhd \
--enable-decoder=h264_cuvid \
--enable-decoder=h264_mediacodec \
--enable-decoder=h264_mmal \
--enable-decoder=h264_qsv \
--enable-decoder=h264_vda \
--enable-decoder=h264_vdpau \
--enable-decoder=mjpeg \
--enable-decoder=mjpeg_cuvid \
--enable-decoder=mjpegb \
--enable-decoder=rawvideo \
--enable-decoder=pcm_alaw \
--enable-decoder=pcm_f32be \
--enable-decoder=pcm_f32le \
--enable-decoder=pcm_f64be \
--enable-decoder=pcm_f64le \
--enable-decoder=pcm_s16be \
--enable-decoder=pcm_s16be_planar \
--enable-decoder=pcm_s16le \
--enable-decoder=pcm_s16le_planar \
--enable-decoder=pcm_s24be \
--enable-decoder=pcm_s24le \
--enable-decoder=pcm_s32be \
--enable-decoder=pcm_s32le \
--enable-decoder=pcm_s8 \
--enable-decoder=pcm_u16be \
--enable-decoder=pcm_u16le \
--enable-decoder=pcm_u24be \
--enable-decoder=pcm_u24le \
--enable-decoder=pcm_u8 \
\
--enable-encoder=bmp \
--enable-encoder=gif \
--enable-encoder=png \
--enable-encoder=apng \
--enable-encoder=aac \
--enable-encoder=aac_at \
--enable-encoder=ac3 \
--enable-encoder=mpeg2_qsv \
--enable-encoder=mpeg2video \
--enable-encoder=mpeg4 \
--enable-encoder=h264_nvenc \
--enable-encoder=h264_omx \
--enable-encoder=h264_qsv \
--enable-encoder=h264_vaapi \
--enable-encoder=h264_videotoolbox \
--enable-encoder=libx264 \
--enable-encoder=libmp3lame \
--enable-encoder=rawvideo \
--enable-encoder=pcm_alaw \
--enable-encoder=pcm_f32be \
--enable-encoder=pcm_f32le \
--enable-encoder=pcm_f64be \
--enable-encoder=pcm_f64le \
--enable-encoder=pcm_s16be \
--enable-encoder=pcm_s16be_planar \
--enable-encoder=pcm_s16le \
--enable-encoder=pcm_s16le_planar \
--enable-encoder=pcm_s24be \
--enable-encoder=pcm_s24le \
--enable-encoder=pcm_s32be \
--enable-encoder=pcm_s32le \
--enable-encoder=pcm_s8 \
--enable-encoder=pcm_u16be \
--enable-encoder=pcm_u16le \
--enable-encoder=pcm_u24be \
--enable-encoder=pcm_u24le \
--enable-encoder=pcm_u8 \
\
--enable-demuxer=apng \
--enable-demuxer=bmv \
--enable-demuxer=gif \
--enable-demuxer=wav \
--enable-demuxer=aac \
--enable-demuxer=ac3 \
--enable-demuxer=mp3 \
--enable-demuxer=avi \
--enable-demuxer=mpegps \
--enable-demuxer=mpegts \
--enable-demuxer=mpegvideo \
--enable-demuxer=mjpeg \
--enable-demuxer=rawvideo \
--enable-demuxer=pcm_alaw \
--enable-demuxer=pcm_f32be \
--enable-demuxer=pcm_f32le \
--enable-demuxer=pcm_f64be \
--enable-demuxer=pcm_f64le \
--enable-demuxer=pcm_s16be \
--enable-demuxer=pcm_s16le \
--enable-demuxer=pcm_s24be \
--enable-demuxer=pcm_s24le \
--enable-demuxer=pcm_s32be \
--enable-demuxer=pcm_s32le \
--enable-demuxer=pcm_s8 \
--enable-demuxer=pcm_u16be \
--enable-demuxer=pcm_u16le \
--enable-demuxer=pcm_u24be \
--enable-demuxer=pcm_u24le \
--enable-demuxer=pcm_u8 \
--enable-demuxer=image2 \
\
--enable-muxer=apng \
--enable-muxer=gif \
--enable-muxer=wav \
--enable-muxer=ac3 \
--enable-muxer=mp3 \
--enable-muxer=mp4 \
--enable-muxer=avi \
--enable-muxer=mjpeg \
--enable-muxer=rawvideo \
--enable-muxer=pcm_alaw \
--enable-muxer=pcm_f32be \
--enable-muxer=pcm_f32le \
--enable-muxer=pcm_f64be \
--enable-muxer=pcm_f64le \
--enable-muxer=pcm_s16be \
--enable-muxer=pcm_s16le \
--enable-muxer=pcm_s24be \
--enable-muxer=pcm_s24le \
--enable-muxer=pcm_s32be \
--enable-muxer=pcm_s32le \
--enable-muxer=pcm_s8 \
--enable-muxer=pcm_u16be \
--enable-muxer=pcm_u16le \
--enable-muxer=pcm_u24be \
--enable-muxer=pcm_u24le \
--enable-muxer=pcm_u8 \
--enable-muxer=image2 \
--enable-muxer=md5 \
\
--enable-parser=aac \
--enable-parser=aac_latm \
--enable-parser=ac3 \
--enable-parser=bmp \
--enable-parser=png \
--enable-parser=h264 \
--enable-parser=mjpeg \
--enable-parser=mpeg4video \
--enable-parser=mpegaudio \
--enable-parser=mpegvideo \
\
--enable-protocol=file \
--enable-protocol=ftp \
--enable-protocol=http \
--enable-protocol=tcp \
--enable-protocol=udp \
--enable-protocol=pipe \
--enable-protocol=data \
\
--enable-indev=lavfi \
--enable-indev=alsa \
--enable-indev=fbdev \
\
--enable-outdev=opengl \
--enable-outdev=alsa \
--enable-outdev=fbdev \
\
--enable-libx264 \
--enable-libmp3lame \
--enable-zlib \
\
--disable-shared \
--enable-static \
--enable-hwaccels \
\
--disable-programs \
--disable-network \
\
|| exit 1

make -j${NUMBER_OF_CORES} && make install || exit 1

popd
