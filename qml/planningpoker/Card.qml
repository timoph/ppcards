import QtQuick 2.3

Rectangle {
    id: rootrect
    width: 270
    height: 420
    color: "#000000"

    property url imageSource

    Rectangle {
        id: cardrect
        anchors.centerIn: parent
        width: parent.width * 0.92
        height: parent.height * 0.92
        radius: Math.min(width, height) * 0.05
        border.color: "#000000"
        border.width: 1
        smooth: true

        readonly property real shortSide: Math.min(width, height)
        readonly property real margin: shortSide * 0.05
        readonly property real cornerSize: shortSide * 0.2

        Image {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: cardrect.margin
            source: rootrect.imageSource
            width: cardrect.cornerSize
            height: cardrect.cornerSize
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
        }

        Image {
            anchors.centerIn: parent
            source: rootrect.imageSource
            width: cardrect.shortSide * 0.6
            height: width
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
        }

        Image {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: cardrect.margin
            source: rootrect.imageSource
            width: cardrect.cornerSize
            height: cardrect.cornerSize
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            rotation: 180
        }
    }
}
