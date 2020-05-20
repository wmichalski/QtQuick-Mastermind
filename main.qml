import QtQuick.Window 2.12
import QtQuick 2.12


Window {
    id: root
    visible: true
    minimumWidth: 386
    minimumHeight: 820
    color: "#bbbbbb"

    property var selectedColorsArr: []
    property var triesTaken: 0
    property var colors: ["#f70d1a", "#ff5f00", "#ffe302", "#a6d608", "#00aaee", "#9f00ff"]
    property var solution: createSolution()

    function createSolution() {
        var arr = []
        for(var i = 0; i < 4; ++i)
            arr.push(Math.floor(Math.random() * colors.length))

        console.log(arr)
        return arr
    }

    function submitColors(){
        if (selectedColorsArr.length == 4){
            for (var j = 0; j < 4; ++j){
                prevGuessesRepeater.itemAt(triesTaken * 4 + j).color = colors[selectedColorsArr[j]]
                selectedColorsRepeater.itemAt(j).color = selectedColorsRepeater.itemAt(j).defaultColor
            }

            var correct = 0;
            var misplaced = 0;
            var set_correct = Array(colors.length).fill(0);
            var set_selected = Array(colors.length).fill(0)

            for (var i = 0; i < solution.length; i++) {
              if (solution[i] === selectedColorsArr[i]) correct++;
              set_correct[solution[i]]++
              set_selected[selectedColorsArr[i]]++
            }
            for (var i = 0; i < colors.length; i++) {
             misplaced+=Math.min(set_selected[i], set_correct[i]);
            }
            misplaced -= correct

            if (correct === 4) {gameOverText.visible = true; gameOverText.text = "Congratulations, you won!"; gameOverText.state = "gameover"}

            for (var i = 0; i < 4; ++i){
                if (correct){
                    correct -= 1;
                    scoresGridRepeater.itemAt(4*triesTaken+i).color = "#FFFFFF"
                }
                else if (misplaced){
                    misplaced -= 1;
                    scoresGridRepeater.itemAt(4*triesTaken+i).color = "#000000"
                }
            }
           selectedColorsArr = []
           triesTaken += 1

           if (triesTaken === 10) {
               gameOverText.visible = true; gameOverText.text = "You lost."; gameOverText.state = "gameover";
               for(var i = 0; i < 4; i++)
                   selectedColorsRepeater.itemAt(i).color = colors[solution[i]]
           }
        }
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
             id: scoresGridRepeater
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
        text: "Reset"
    }

    Button {
        id: submitButton
        anchors.bottom: selectable.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: selectable.horizontalCenter
        type: "SUBMIT"
        text: "Submit"
    }

    Text {
        id: gameOverText
        text: "Game over"
        visible: false
        minimumPixelSize: 30
        anchors.bottom: submitButton.top
        anchors.bottomMargin: 20
        anchors.horizontalCenter: selectable.horizontalCenter
        states: [
            State{
                name: "gameover"
                PropertyChanges {
                    target: submitButton;
                    enabled: false
                }
                PropertyChanges {
                    target: resetButton;
                    enabled: false
                }
                PropertyChanges {
                    target: selectable;
                    enabled: false
                }
            }
        ]
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


