import QtQuick 2.3

FocusScope {
    id: mainpage

    // Card images in deck order (index 0 - 12)
    readonly property var cards: [
        "none.png", "half.png", "one.png", "two.png", "three.png",
        "five.png", "eight.png", "thirteen.png", "twenty.png",
        "fourty.png", "hundred.png", "what.png", "coffee.png"
    ]

    function selectCard(index) {
        flick.currentIndex = index
    }

    ListView {
        id: flick
        anchors.fill: parent
        focus: true
        orientation: ListView.Horizontal
        model: mainpage.cards
        snapMode: ListView.SnapOneItem
        // Keep currentIndex in sync with the visible card so that both
        // swiping and arrow keys move one card at a time.
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 200
        keyNavigationWraps: true
        boundsBehavior: Flickable.StopAtBounds

        delegate: Card {
            width: flick.width
            height: flick.height
            imageSource: "qrc:/" + modelData
        }
    }
}
