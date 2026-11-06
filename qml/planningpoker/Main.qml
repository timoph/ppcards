import QtQuick

Rectangle {
    id: appWindow
    // Initial window size on desktop; the view resizes the root item to fit.
    width: 480
    height: 700
    color: "#000000"

    MainPage {
        id: mainPage
        anchors.fill: parent
        focus: true
    }
}
