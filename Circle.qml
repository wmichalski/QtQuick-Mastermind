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

    MouseArea {
        id: mousearea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: if (mouse.button == Qt.LeftButton && root.parent.name == "row") {
                       if (selectedColorsArr.length != 4)
                       {
                       selectedColorsArr.push(color);
                       selectedColorsRepeater.itemAt(selectedColorsArr.length - 1).color = color
                       console.log(selectedColorsArr)
                       }
                   }
    }
}
