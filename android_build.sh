#!/bin/bash

. settings.sh

BASEDIR=$(pwd)

for i in "${SUPPORTED_ARCHITECTURES[@]}"
do
  echo "Building $i"
  #TOOLCHAIN_PREFIX=${BASEDIR}/toolchain-android-$i
  #rm -rf ${TOOLCHAIN_PREFIX}
  # $1 = architecture
  # $2 = base directory
  # $3 = pass 1 if you want to export default compiler environment variables
  ./x264_build.sh $i $BASEDIR 1 || exit 1
  #./libpng_build.sh $i $BASEDIR 1 || exit 1
  ./lame_build.sh $i $BASEDIR 1 || exit 1
  ./ffmpeg_build.sh $i $BASEDIR 1 || exit 1
  #rm -rf ${TOOLCHAIN_PREFIX}
done
