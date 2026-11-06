import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "Decks.js" as Decks

// Overlay for picking a card directly and for choosing the deck.
FocusScope {
    id: menu

    property var cards: []
    property int currentIndex: 0
    property string deckId
    property string customDeck

    signal cardSelected(int index)
    signal deckSelected(string deckId)
    signal customDeckEdited(string text)
    signal closeRequested()

    Keys.onEscapePressed: menu.closeRequested()
    Keys.onBackPressed: menu.closeRequested()

    component DeckButton: Rectangle {
        id: button

        property alias text: label.text
        property bool selected: false
        signal clicked()

        implicitWidth: label.implicitWidth + 32
        implicitHeight: label.implicitHeight + 16
        radius: height / 2
        color: selected ? "#ffffff" : "transparent"
        border.color: "#ffffff"
        border.width: 1

        Text {
            id: label
            anchors.centerIn: parent
            color: button.selected ? "#000000" : "#ffffff"
            font.bold: button.selected
            font.pixelSize: 16
        }

        MouseArea {
            anchors.fill: parent
            onClicked: button.clicked()
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#f0000000"
    }

    // Keep touches from reaching the cards underneath.
    MouseArea {
        anchors.fill: parent
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        Flow {
            Layout.fillWidth: true
            spacing: 8

            Repeater {
                model: Decks.decks
                DeckButton {
                    required property var modelData
                    text: modelData.title
                    selected: menu.deckId === modelData.id
                    onClicked: menu.deckSelected(modelData.id)
                }
            }
        }

        TextField {
            Layout.fillWidth: true
            visible: menu.deckId === "custom"
            text: menu.customDeck
            placeholderText: "Values separated by commas, e.g. 1, 2, 4, 8, ?, coffee"
            onEditingFinished: menu.customDeckEdited(text)
        }

        Text {
            Layout.fillWidth: true
            visible: menu.deckId === "custom" && Decks.parse(menu.customDeck).length === 0
            text: "The custom deck is empty, showing the Fibonacci deck."
            color: "#cccccc"
            wrapMode: Text.WordWrap
        }

        GridView {
            id: grid
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: menu.cards

            readonly property int columns: Math.max(3, Math.floor(width / 110))
            cellWidth: width / columns
            cellHeight: cellWidth * 1.4

            delegate: Item {
                id: cell
                required property int index
                required property var modelData

                width: grid.cellWidth
                height: grid.cellHeight

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 6
                    radius: width * 0.08
                    color: "#ffffff"
                    border.color: cell.index === menu.currentIndex ? "#4a90e2" : "#000000"
                    border.width: cell.index === menu.currentIndex ? 4 : 1

                    CardSymbol {
                        anchors.fill: parent
                        anchors.margins: parent.width * 0.12
                        label: cell.modelData.label
                        image: cell.modelData.image
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: menu.cardSelected(cell.index)
                }
            }
        }

        Button {
            Layout.alignment: Qt.AlignHCenter
            text: "Close"
            onClicked: menu.closeRequested()
        }
    }
}
