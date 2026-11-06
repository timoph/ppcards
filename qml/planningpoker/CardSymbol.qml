import QtQuick

// Card value shown as text, or as a picture for special cards.
Item {
    id: symbol

    property string label
    property string image

    Image {
        anchors.fill: parent
        visible: symbol.image !== ""
        // Relative to this file, i.e. the root of the QML module.
        source: symbol.image
        sourceSize.width: width
        sourceSize.height: height
        fillMode: Image.PreserveAspectFit
        smooth: true
        mipmap: true
    }

    Text {
        anchors.fill: parent
        visible: symbol.image === ""
        text: symbol.label
        color: "#000000"
        font.pixelSize: Math.max(8, height * 0.6)
        fontSizeMode: Text.Fit
        minimumPixelSize: 8
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
