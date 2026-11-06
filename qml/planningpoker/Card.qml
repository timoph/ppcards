import QtQuick

Item {
    id: card
    width: 270
    height: 420

    property string label
    property string image
    // true shows the back of the card
    property bool flipped: false

    signal clicked()
    signal pressAndHold()

    Flipable {
        id: flipable
        anchors.fill: parent

        front: CardFace {
            anchors.fill: parent
            label: card.label
            image: card.image
        }
        back: CardBack {
            anchors.fill: parent
        }

        transform: Rotation {
            origin.x: flipable.width / 2
            origin.y: flipable.height / 2
            axis { x: 0; y: 1; z: 0 }
            angle: card.flipped ? 180 : 0
            Behavior on angle { NumberAnimation { duration: 300; easing.type: Easing.InOutQuad } }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: card.clicked()
        onPressAndHold: card.pressAndHold()
    }
}
