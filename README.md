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
2. Cross compile Qt 5.12 or higher for Android
3. Create a stand alone Android NDK in the Qt5 install dir:
sudo /opt/Android/ndk-bundle/build/tools/make_standalone_toolchain.py --arch arm64  --api 24 --install-dir /opt/android-24-qt5/ --force
4. Fix the paths in the build script accordingly to your individual setup
5. Of course always read a script before executing it, but then you can execute it :-)

## DISCLAIMER:

This script is buggy as hell and I hacked it together under a lot of shouting at my LCD.
No warranty what so ever that it will work for you as well.


