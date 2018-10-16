cmake_minimum_required(VERSION 3.1)

project(QtProcessPlanner LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(cmake/qt-android-mk-apk.cmake)
set(ANDROID_PLATFORM "android-27")
set(ANDROID_TOOLCHAIN "clang")

add_subdirectory(src)

if(ANDROID)
qt_android_build_apk(
    TARGET ${PROJECT_NAME}
    PACKAGE_NAME org.example.QmlCmakeDemo
    QML_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}
    ANDROID_EXTRA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/android
)
endif()

