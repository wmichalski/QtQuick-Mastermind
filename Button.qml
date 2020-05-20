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
                       if (root.type == "RESET")
                       {
                            for (var i = 0; i < 4; ++i)
                            {
                                selectedColorsRepeater.itemAt(i).color = defaultColor
                            }
                           selectedColorsArr = []
                       }
                       if (root.type == "SUBMIT")
                       {
                           if (selectedColorsArr.length == 4)
                           {
                               for (var j = 0; j < 4; ++j)
                               {
                                   prevGuessesRepeater.itemAt(triesTaken * 4 + j).color = selectedColorsArr[j]
                                   selectedColorsRepeater.itemAt(j).color = defaultColor
                               }
                              selectedColorsArr = []
                              triesTaken += 1
                           }
                       }
                   }
    }
}
