import QtQuick 1.1

Rectangle {
    id: rootrect
    width: 270
    height: 420
    color: "#000000"

    property string cardnumber: "½"

    Rectangle {
        id: cardrect
        anchors.centerIn: parent
        width: parent.width * 0.92
        height: parent.height * 0.92
        radius: 20
        border.color: "#000000"
        border.width: 1
        smooth: true

        Image {
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            source: "image://pics/" + cardnumber
            width: 80
            height: 80
        }

        Image {
            anchors.centerIn: parent
            source: "image://pics/" + cardnumber
        }

        Image {
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            source: "image://pics/" + cardnumber
            width: 80
            height: 80
            rotation: 180
        }
    }
}
