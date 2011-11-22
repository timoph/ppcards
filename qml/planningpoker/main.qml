import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }

        ToolButton {
            id: selectButton
            anchors.centerIn: parent
            text: "select"
            onClicked: {
                selectDialog.selectedIndex = -1
                selectDialog.open()
            }
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("About")
                onClicked: aboutDialog.open()
            }
        }
    }

    QueryDialog {
        id: aboutDialog
        titleText: qsTr("Planning poker")
        message: qsTr("by Timo Härkönen\ntimop.harkonen@gmail.com")
    }

    SelectionDialog {
        id: selectDialog
        titleText: qsTr("Pick your estimate")
        model: ListModel {
            ListElement { name: "0" }
            ListElement { name: "½" }
            ListElement { name: "1" }
            ListElement { name: "2" }
            ListElement { name: "3" }
            ListElement { name: "5" }
            ListElement { name: "8" }
            ListElement { name: "13" }
            ListElement { name: "20" }
            ListElement { name: "40" }
            ListElement { name: "100" }
            ListElement { name: "?" }
            ListElement { name: "coffee" }
        }

        onAccepted: mainPage.setSelectedCard(selectDialog.selectedIndex)
    }

    Component.onCompleted: {
        theme.inverted = true
    }
}
