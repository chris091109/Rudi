import QtQuick

Rectangle {
    id: powerButton
    implicitWidth: 32
    implicitHeight: 38
    color: powerMouseArea.containsMouse ? "#e05c5c" : "#0c0c0c"
    radius: 10
    border.color: powerMouseArea.containsMouse ? "#e05c5c" : "#2a2a2a"
    border.width: 1
    
    signal clicked
    
    Behavior on color {
        ColorAnimation { duration: 200 }
    }
    
    Behavior on border.color {
        ColorAnimation { duration: 200 }
    }
    
    Text {
        anchors.centerIn: parent
        color: powerMouseArea.containsMouse ? "#0c0c0c" : "#dedede"
        font.pixelSize: 16
        font.bold: true
        text: "⏻"
        
        Behavior on color {
            ColorAnimation { duration: 200 }
        }
    }
    
    MouseArea {
        id: powerMouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: powerButton.clicked()
    }
}
