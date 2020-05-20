import QtQuick 2.0

Rectangle {
    id: root
    width: 50
    anchors.margins: 10
    radius: width
    height: width
    border.color: "black"
    border.width: 3
    property var defaultColor: "#dddddd"
    color: defaultColor

    Behavior on color{
        ColorAnimation {
        }
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: if (mouse.button === Qt.LeftButton && root.parent.name === "row") {
                       if (selectedColorsArr.length != 4)
                       {
                       selectedColorsArr.push(colors.indexOf(color.toString()));
                       selectedColorsRepeater.itemAt(selectedColorsArr.length - 1).color = color
                       }
                   }
        onEntered: if(root.parent.name === "row") upscaleAnimation.start()
        onExited: if(root.parent.name === "row") downscaleAnimation.start()
        hoverEnabled: true
    }

    UpscaleAnimation{
        id: upscaleAnimation
    }

    DownscaleAnimation{
        id: downscaleAnimation
    }
}
