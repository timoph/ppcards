import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: mainpage
    tools: commonTools
    orientationLock: PageOrientation.LockPortrait

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
        highlightMoveSpeed: 1600
    }
}
