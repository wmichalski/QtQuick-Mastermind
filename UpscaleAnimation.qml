import QtQuick 2.0

SequentialAnimation{
    id: upscaleAnimation
    ScriptAction{
        script: parent.z = 2
    }
    NumberAnimation {
        target: root
        property: "scale"
        to: 1.2
        duration: 200
    }
 }
