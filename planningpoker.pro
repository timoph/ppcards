TARGET = ppcards

QT += quick gui core

SOURCES += main.cpp \
    imageprovider.cpp

OTHER_FILES += \
    qml/planningpoker/MainPage.qml \
    qml/planningpoker/main.qml \
    qml/planningpoker/Card.qml

HEADERS += \
    imageprovider.h

RESOURCES += \
    resources.qrc


