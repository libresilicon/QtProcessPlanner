cmake_minimum_required(VERSION 3.1)

project(QtProcessPlanner LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include("android-cmake/android.apk.cmake" REQUIRED)

add_subdirectory(src)

android_create_apk(QtProcessPlanner qtprocessplanner /tmp/apk /tmp/apk/usr/libs /tmp/apk/usr/android /tmp/apk/usr/assets )
