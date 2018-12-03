cmake_minimum_required(VERSION 3.1)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

set(SOURCE_FILES
	"fileio.cpp"
	"main.cpp"
	"treeitem.cpp"
	"customtype.cpp"
	"treemodel.cpp"
	#"treemodel_plugin.cpp"
	"../db/db.qrc"
       	"../qml/qml.qrc" 
	"../images/images.qrc"
)

if(ANDROID)
	add_library(${PROJECT_NAME} SHARED ${SOURCE_FILES})
else()
    add_executable(${PROJECT_NAME} ${SOURCE_FILES})
endif()

target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick)

if(ANDROID)
	target_link_libraries(${PROJECT_NAME} PRIVATE c++_shared)
endif()

