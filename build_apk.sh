# Set up some variables to shorten stuff later on:
export BUILD_DIR=build-android
export ANDROID_SDK=/opt/Android/
export ANDROID_NDK=/opt/Android/ndk-bundle/
export QT_ROOT=/opt/android-qt5/

rm -rf $BUILD_DIR 
mkdir $BUILD_DIR
cd $BUILD_DIR

export LD_LIBRARY_PATH=/opt/Android/ndk-bundle/sysroot/usr/lib/aarch64-linux-android

$ANDROID_SDK/cmake/3.6.4111459/bin/cmake \
	-DANDROID=ON \
	-DCMAKE_ANDROID_NDK=$ANDROID_NDK \
	-DCMAKE_ANDROID_ARCH_ABI=arm64-v8a \
	-DCMAKE_ANDROID_NDK_TOOLCHAIN_HOST_TAG=linux-x86_64 \
	-DCMAKE_CXX_ANDROID_TOOLCHAIN_MACHINE=aarch64-linux-android \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_PREFIX_PATH=$QT_ROOT \
	-DCMAKE_SYSTEM_NAME=Android \
	-DANDROID_SDK_ROOT=$ANDROID_SDK \
	-DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION=4.9 \
	-DCMAKE_CXX_COMPILER=$ANDROID_NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-g++ \
	-DCMAKE_C_COMPILER=$ANDROID_NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc \
	-DCMAKE_CXX_FLAGS="--sysroot=$QT_ROOT/sysroot --prefix=$QT_ROOT" \
	..

make QtProcessPlanner-apk
