cmake_minimum_required(VERSION 3.1)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

if(ANDROID)
    add_library(${PROJECT_NAME} "fileio.cpp" "fileio_plugin.cpp" "main.cpp" "../db.qrc"  "../qml/qml.qrc" "../images/images.qrc")
else()
    add_executable(${PROJECT_NAME} "fileio.cpp" "fileio_plugin.cpp" "main.cpp" "../db.qrc"  "../qml/qml.qrc" "../images/images.qrc")
endif()

#target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick)

if(ANDROID)
	target_link_libraries(${PROJECT_NAME} PRIVATE c++_shared)
endif()

