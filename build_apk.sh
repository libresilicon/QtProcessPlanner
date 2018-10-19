# Set up some variables to shorten stuff later on:
export BUILD_DIR=build-android
export ANDROID_SDK=/opt/Android
export ANDROID_NDK=/opt/Android/ndk-bundle
export QT_ROOT=/opt/android-qt5

rm -rf $BUILD_DIR 
mkdir $BUILD_DIR
cd $BUILD_DIR

#export LD_LIBRARY_PATH=/opt/Android/ndk-bundle/sysroot/usr/lib/aarch64-linux-android
export TOOLCHAIN=$ANDROID_NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin
#export TOOLCHAIN=$QT_ROOT/bin

export CC=$TOOLCHAIN/aarch64-linux-android-gcc
export CXX=$TOOLCHAIN/aarch64-linux-android-g++

export CXXFLAGS="--sysroot=$QT_ROOT/sysroot"
export CXXFLAGS="$CXXFLAGS --prefix=$QT_ROOT"

$ANDROID_SDK/cmake/3.6.4111459/bin/cmake \
	-DANDROID=ON \
	-DANDROID_SDK_ROOT=$ANDROID_SDK / \
	-DCMAKE_ANDROID_NDK=$ANDROID_NDK / \
	-DCMAKE_ANDROID_ARCH_ABI=arm64-v8a \
	-DCMAKE_ANDROID_NDK_TOOLCHAIN_HOST_TAG=linux-x86_64 \
	-DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION=4.9 \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_CXX_ANDROID_TOOLCHAIN_MACHINE=aarch64-linux-android \
	-DAPK_NDK_TOOLCHAIN_PREFIX=aarch64-linux-android \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
	-DCMAKE_CXX_FLAGS_DEBUG="$CXXFLAGS" \
	-DCMAKE_CXX_FLAGS_MINSIZEREL="$CXXFLAGS" \
	-DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
	-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="$CXXFLAGS" \
	-DCMAKE_C_COMPILER=$CC \
	-DCMAKE_CXX_COMPILER=$CXX \
	-DCMAKE_PREFIX_PATH=$QT_ROOT/ \
	-DCMAKE_SYSTEM_NAME=Android \
	..

make QtProcessPlanner
make QtProcessPlanner-apk
cp QtProcessPlanner-apk-build/build/outputs/apk/release/QtProcessPlanner-apk-build-release-unsigned.apk QtProcessPlanner.apk
$ANDROID_SDK/build-tools/28.0.3/apksigner sign --ks $ANDROID_SDK/key.jks QtProcessPlanner.apk
