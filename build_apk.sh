# Set up some variables to shorten stuff later on:
export BUILD_DIR=build-android
export ANDROID_SDK=/opt/Android
export ANDROID_NDK=/opt/Android/ndk-bundle
export QT_ROOT=/opt/android-qt5

rm -rf $BUILD_DIR 
mkdir $BUILD_DIR
cd $BUILD_DIR

export LD_LIBRARY_PATH=/opt/Android/ndk-bundle/sysroot/usr/lib/aarch64-linux-android

$ANDROID_SDK/cmake/3.6.4111459/bin/cmake \
	-DANDROID=ON \
	-DANDROID_SDK_ROOT=$ANDROID_SDK \
	-DCMAKE_ANDROID_NDK=$ANDROID_NDK \
	-DCMAKE_ANDROID_ARCH_ABI=arm64-v8a \
	-DCMAKE_ANDROID_STL_TYPE=gnustl_shared \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_CXX_COMPILER=$ANDROID_NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-g++ \
	-DCMAKE_C_COMPILER=$ANDROID_NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc \
	-DCMAKE_FIND_ROOT_PATH=$ANDROID_NDK/ndk-bundle/sysroot/usr/lib/aarch64-linux-android \
	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
	-DCMAKE_PREFIX_PATH=$QT_ROOT \
	-DCMAKE_SYSTEM_NAME=Android \
	-DCMAKE_SYSTEM_VERSION=27 \
	-DCMAKE_CXX_FLAGS="--sysroot=/opt/android-qt5/sysroot --prefix=/opt/android-qt5" \
	..

make QtProcessPlanner-apk
