cmake_minimum_required(VERSION 3.16)

project(ppcards VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

# Prefer Qt 6, fall back to Qt 5
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Gui Quick)

add_executable(ppcards
    main.cpp
    imageprovider.cpp
    imageprovider.h
    resources.qrc
)

target_link_libraries(ppcards PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
    Qt${QT_VERSION_MAJOR}::Quick
)

include(GNUInstallDirs)
install(TARGETS ppcards RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
