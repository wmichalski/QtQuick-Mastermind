import QtQuick 2.0

SequentialAnimation{
    id: downscaleAnimation
    ScriptAction{
        script: parent.z = 2
    }
    NumberAnimation {
        target: root
        property: "scale"
        to: 1
        duration: 200
    }
}
