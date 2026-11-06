import QtQuick
import QtCore
import "Decks.js" as Decks

FocusScope {
    id: mainpage

    // When true the current card is shown face down and cannot be changed.
    property bool hidden: false
    readonly property var cards: Decks.build(settings.deck, settings.customDeck)

    // Persistent user choices.
    Settings {
        id: settings
        property string deck: "fibonacci"
        property string customDeck: ""
    }

    function selectCard(index) {
        hidden = false
        flick.currentIndex = index
        closeMenu()
    }

    function selectDeck(deckId) {
        settings.deck = deckId
        flick.currentIndex = 0
    }

    function setCustomDeck(text) {
        settings.customDeck = text
        flick.currentIndex = 0
    }

    function toggleHidden() {
        hidden = !hidden
    }

    function openMenu() {
        hidden = false
        menu.visible = true
        menu.forceActiveFocus()
    }

    function closeMenu() {
        menu.visible = false
        flick.forceActiveFocus()
    }

    ListView {
        id: flick
        anchors.fill: parent
        focus: true
        orientation: ListView.Horizontal
        model: mainpage.cards
        interactive: !mainpage.hidden
        snapMode: ListView.SnapOneItem
        // Keep currentIndex in sync with the visible card so that both
        // swiping and arrow keys move one card at a time.
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 200
        keyNavigationWraps: true
        boundsBehavior: Flickable.StopAtBounds

        // A hidden card stays put until it is revealed.
        keyNavigationEnabled: !mainpage.hidden
        Keys.onSpacePressed: mainpage.toggleHidden()
        Keys.onReturnPressed: mainpage.toggleHidden()
        Keys.onEnterPressed: mainpage.toggleHidden()

        delegate: Card {
            width: flick.width
            height: flick.height
            label: modelData.label
            image: modelData.image
            flipped: ListView.isCurrentItem && mainpage.hidden
            onClicked: mainpage.toggleHidden()
            onPressAndHold: mainpage.openMenu()
        }
    }

    Shortcut {
        sequences: ["M", "Menu"]
        enabled: !menu.visible
        onActivated: mainpage.openMenu()
    }

    Rectangle {
        id: hint
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.08
        width: hintText.implicitWidth + 24
        height: hintText.implicitHeight + 16
        radius: height / 2
        color: "#cc000000"
        opacity: 0

        Text {
            id: hintText
            anchors.centerIn: parent
            color: "#ffffff"
            text: "Tap: hide / reveal  ·  Hold: cards & decks"
        }

        SequentialAnimation on opacity {
            running: true
            NumberAnimation { to: 1; duration: 300 }
            PauseAnimation { duration: 3000 }
            NumberAnimation { to: 0; duration: 600 }
        }
    }

    DeckMenu {
        id: menu
        anchors.fill: parent
        visible: false
        cards: mainpage.cards
        currentIndex: flick.currentIndex
        deckId: settings.deck
        customDeck: settings.customDeck

        onCardSelected: (index) => mainpage.selectCard(index)
        onDeckSelected: (deckId) => mainpage.selectDeck(deckId)
        onCustomDeckEdited: (text) => mainpage.setCustomDeck(text)
        onCloseRequested: mainpage.closeMenu()
    }
}
