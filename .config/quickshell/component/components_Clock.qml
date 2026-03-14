import QtQuick

Rectangle {
    implicitWidth: 32
    implicitHeight: 70
    color: "transparent"
    radius: 12
    
    Column {
        anchors.centerIn: parent
        spacing: 2
        
        Text {
            id: hourText
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#3584e4"
            font.pixelSize: 16
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
        }
        
        Text {
            id: minuteText
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#dedede"
            font.pixelSize: 16
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
        }
    }
    
    Component.onCompleted: updateTime()
    
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateTime()
    }
    
    function updateTime() {
        var now = new Date()
        hourText.text = Qt.formatDateTime(now, "HH")
        minuteText.text = Qt.formatDateTime(now, "mm")
    }
}
