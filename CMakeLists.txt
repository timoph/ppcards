cmake_minimum_required(VERSION 3.21)

project(ppcards VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(ppcards
    main.cpp
)

set(PPCARDS_QML_FILES
    qml/planningpoker/Main.qml
    qml/planningpoker/MainPage.qml
    qml/planningpoker/Card.qml
    qml/planningpoker/CardFace.qml
    qml/planningpoker/CardBack.qml
    qml/planningpoker/CardSymbol.qml
    qml/planningpoker/DeckMenu.qml
    qml/planningpoker/Decks.js
)
set(PPCARDS_RESOURCES
    pics/coffee.png
)

# Flatten paths so that all files live at the module root and can
# refer to each other by plain file name.
foreach(file IN LISTS PPCARDS_QML_FILES PPCARDS_RESOURCES)
    get_filename_component(name ${file} NAME)
    set_source_files_properties(${file} PROPERTIES QT_RESOURCE_ALIAS ${name})
endforeach()

qt_add_qml_module(ppcards
    URI PlanningPoker
    VERSION 1.0
    QML_FILES ${PPCARDS_QML_FILES}
    RESOURCES ${PPCARDS_RESOURCES}
)

target_link_libraries(ppcards PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS ppcards
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
