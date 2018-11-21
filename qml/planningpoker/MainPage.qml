import QtQuick 2.10

Rectangle {
    id: mainpage
    height: 700
    width: 480

    function setSelectedCard(ind) {
        flick.currentIndex = flick.indexAt(flick.contentX, flick.contentY)
        flick.currentIndex = ind
    }

    Component {
        id: listdelegate
        Card {
            width: mainpage.width
            height: mainPage.height
            cardnumber: index
        }
    }

    ListView {
        id: flick
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height
        orientation: ListView.Horizontal
        model: 13
        delegate: listdelegate
        snapMode: ListView.SnapOneItem
        keyNavigationWraps: true
    }
}
