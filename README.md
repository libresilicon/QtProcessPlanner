# QtProcessPlanner

This application is intended to be used in clean rooms for being used on your phone or tablet which
will then tell you what to do in which order with what machine, in order to build a certain transistor
structure. That's why it's called the process planner.

It's a tool which helps you plan and follow your manufacturing process, because normal paper (print outs)
are not allowed in clean rooms because of the contamination risk.

## Building for your desktop

The usual

mkdir build
cmake ..
make

## Building an APK (for Android)

1. Clone this project
2. Create a android ndk standalone toolchain
3. Cross compile Qt 5.12 or higher for Android
4. Export these paths:
export ANDROID_HOME=<android-sdk-linux>
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
4. Set these env parameters:
ANDROID_STANDALONE_TOOLCHAIN=<path to the ndk standalone toolchain>
ANDROID_CMAKE_HOME=<path to the android-cmake project>
5. Include the android.apk.cmake in a cmake CMakeLists.txt by using the line:
include("$ENV{ANDROID_CMAKE_HOME}/android.apk.cmake" REQUIRED)
6. After your .so lib has been built call the cmake macro android_create_apk(...)
