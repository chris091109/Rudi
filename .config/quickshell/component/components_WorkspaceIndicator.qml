import QtQuick
import Quickshell 
import Quickshell.Hyprland 

Rectangle {
    implicitWidth: 32
    implicitHeight: 220
    color: "#0c0c0c"
    radius: 12
    border.color: "#2a2a2a"
    border.width: 1
    
    Column {
        spacing: 10
        anchors.centerIn: parent
        anchors.margins: 8
        
        Repeater {
            model: 9
            
            Item {
                width: 14
                height: 14
                
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                property bool hasWindows: ws && ws.windows ? ws.windows.length > 0 : false
                
                // Inactive workspace with windows
                Rectangle {
                    anchors.centerIn: parent
                    width: hasWindows ? 10 : 6
                    height: hasWindows ? 10 : 6
                    radius: width / 2
                    color: hasWindows ? "#444444" : "#2a2a2a"
                    visible: !isActive
                    
                    Behavior on width {
                        NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
                    }
                    Behavior on height {
                        NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
                    }
                }
                
                // Active workspace
                Rectangle {
                    anchors.centerIn: parent
                    width: 12
                    height: 12
                    radius: 6
                    color: "#3584e4"
                    visible: isActive
                    
                    Rectangle {
                        anchors.centerIn: parent
                        width: 6
                        height: 6
                        radius: 3
                        color: "#0c0c0c"
                    }
                }
                
                MouseArea {
                    anchors.fill: parent
                    anchors.margins: -4
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }
    }
}
