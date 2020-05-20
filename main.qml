import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: root
    visible: true
    minimumWidth: 386
    minimumHeight: 780
    color: "#bbbbbb"

    property var selectedColorsArr: []
    property var triesTaken: 0
    property var colors: ["#F70D1A", "#FF5F00", "#FFE302", "#A6D608", "#00AAEE", "#9F00FF"]
    property var solution: createSolution()

    function createSolution() {
        var arr = []
        for(var i = 0; i < 4; ++i)
        {
            var rnd = colors[Math.floor(Math.random() * colors.length)]
            arr.push(rnd)
        }
        return arr
    }

    Grid {
         id: prevGuessesGrid
         anchors.left: parent.left
         anchors.leftMargin: 20
         anchors.top: parent.top
         anchors.topMargin: 20
         columns: 4
         rows: 10
         spacing: 2

         Repeater {
             id: prevGuessesRepeater
             model: 40
             Circle {
             }
         }
    }

    Grid {
         id: scoresGrid
         anchors.right: parent.right
         anchors.rightMargin: 20
         anchors.top: parent.top
         anchors.topMargin: 20
         columns: 4
         rows: 10
         spacing: 2

         Repeater {
             model: 40
             Circle  {
                 width: 20
                 radius: width
                 height: 50
                 color: "#dddddd"
             }
         }
    }

    Row {
        id: selectedColors
        anchors.top: prevGuessesGrid.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: prevGuessesGrid.horizontalCenter
        spacing: 2

        Repeater {
            id: selectedColorsRepeater
            model: 4
            Circle{
            }
        }
    }

    Button {
        id: resetButton
        anchors.top: scoresGrid.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: scoresGrid.horizontalCenter
        type: "RESET"
        text: "reset"
    }

    Button {
        id: submitButton
        anchors.bottom: selectable.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: selectable.horizontalCenter
        type: "SUBMIT"
        text: "submit"
    }

    Row {
        id: selectable
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20
        spacing: 5
        property var name: "row"

        Repeater {
            id: selectableColors
            model: root.colors

            Circle {
                color: modelData
            }
        }
    }

}


