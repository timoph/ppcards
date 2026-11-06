import QtQuick

Rectangle {
    color: "#000000"

    Rectangle {
        id: cardrect
        anchors.centerIn: parent
        width: parent.width * 0.92
        height: parent.height * 0.92
        radius: Math.min(width, height) * 0.05
        color: "#1f4e8c"
        border.color: "#000000"
        border.width: 1
        smooth: true

        Rectangle {
            anchors.fill: parent
            anchors.margins: Math.min(parent.width, parent.height) * 0.06
            radius: parent.radius * 0.6
            color: "transparent"
            border.color: "#9fbbe0"
            border.width: Math.max(2, Math.min(parent.width, parent.height) * 0.015)

            Text {
                anchors.centerIn: parent
                text: "PP"
                color: "#9fbbe0"
                font.bold: true
                font.pixelSize: Math.max(8, Math.min(parent.width, parent.height) * 0.25)
            }
        }
    }
}
