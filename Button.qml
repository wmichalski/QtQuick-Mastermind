import QtQuick 2.0

Rectangle {
    id: root
    width: 80
    anchors.margins: 10
    radius: 10
    height: 50
    border.color: "black"
    border.width: 3
    property var defaultColor: "#dddddd"
    property string type
    property string text

    color: defaultColor

    Text{
        id: text
        text: root.text
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: if (mouse.button == Qt.LeftButton) {
                       if (root.type === "RESET"){
                            for (var i = 0; i < 4; ++i)
                                selectedColorsRepeater.itemAt(i).color = defaultColor
                            selectedColorsArr = []
                       }
                       if (root.type === "SUBMIT"){
                           submitColors()
                       }
                   }
        onEntered: if(root.type === "SUBMIT" && selectedColorsArr.length == 4 && gameOverText.state !== "gameover" || root.type === "RESET") upscaleAnimation.start()
        onExited: downscaleAnimation.start()
        hoverEnabled: true

    }

    UpscaleAnimation{
        id: upscaleAnimation
    }

    DownscaleAnimation{
        id: downscaleAnimation
    }
}
