import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

Item {
    id: trayRoot
    implicitHeight: Math.max(trayItems.count > 0 ? trayColumn.implicitHeight : 0, 32)

    Column {
        id: trayColumn
        anchors.fill: parent
        spacing: 4

        Repeater {
            id: trayItems
            model: SystemTray.items

            Rectangle {
                width: 32
                height: 32
                radius: 8
                color: trayMouseArea.containsMouse ? "#2a2a2a" : "#0c0c0c"
                border.color: trayMouseArea.containsMouse ? "#3584e4" : "transparent"
                border.width: 1
                
                Behavior on color {
                    ColorAnimation { duration: 150 }
                }
                
                Behavior on border.color {
                    ColorAnimation { duration: 150 }
                }

                Image {
                    id: trayIcon
                    anchors.centerIn: parent
                    width: 20
                    height: 20
                    source: modelData.icon?.toString() ?? ""
                    sourceSize: Qt.size(width, height)
                    smooth: true
                    visible: source != ""
                    
                    // Fallback to text if no icon
                    Component.onCompleted: {
                        if (source == "") {
                            fallbackText.visible = true
                        }
                    }
                }

                Text {
                    id: fallbackText
                    anchors.centerIn: parent
                    color: "#dedede"
                    font.pixelSize: 16
                    text: modelData.title?.charAt(0) ?? "?"
                    visible: false
                }

                MouseArea {
                    id: trayMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                    
                    onClicked: (mouse) => {
                        if (mouse.button === Qt.LeftButton) {
                            modelData.activate()
                        } else if (mouse.button === Qt.RightButton) {
                            modelData.secondaryActivate()
                        } else if (mouse.button === Qt.MiddleButton) {
                            modelData.scroll(0, 1)
                        }
                    }
                }

                // Tooltip
                Rectangle {
                    visible: trayMouseArea.containsMouse && modelData.tooltipTitle
                    color: "#0c0c0c"
                    border.color: "#2e2e2e"
                    border.width: 1
                    radius: 6
                    width: tooltipText.width + 16
                    height: tooltipText.height + 12
                    x: parent.width + 8
                    y: parent.height / 2 - height / 2
                    z: 100

                    Text {
                        id: tooltipText
                        anchors.centerIn: parent
                        color: "#dedede"
                        font.pixelSize: 11
                        text: modelData.tooltipTitle ?? ""
                    }
                }
            }
        }
    }
}
