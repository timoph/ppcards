import QtQuick

Rectangle {
    id: face
    color: "#000000"

    property string label
    property string image

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

        CardSymbol {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: cardrect.margin
            width: cardrect.cornerSize
            height: cardrect.cornerSize
            label: face.label
            image: face.image
        }

        CardSymbol {
            anchors.centerIn: parent
            width: cardrect.shortSide * 0.6
            height: width
            label: face.label
            image: face.image
        }

        CardSymbol {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: cardrect.margin
            width: cardrect.cornerSize
            height: cardrect.cornerSize
            rotation: 180
            label: face.label
            image: face.image
        }
    }
}
