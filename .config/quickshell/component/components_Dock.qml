import QtQuick
import QtQuick.Controls

Rectangle {
    id: dock
    implicitWidth: 32
    implicitHeight: column.implicitHeight + 8
    color: "#0c0c0c"
    radius: 12
    border.color: "#2a2a2a"
    border.width: 1
    
    property string activeMenu: ""
    
    Column {
        id: column
        anchors.fill: parent
        anchors.margins: 4
        spacing: 6
        
        // Volume Button
        Rectangle {
            id: volumeButton
            width: 28
            height: 28
            color: volumeMouseArea.containsMouse || activeMenu === "volume" ? "#2a2a2a" : "transparent"
            radius: 8
            border.color: activeMenu === "volume" ? "#3584e4" : "transparent"
            border.width: 1
            
            Behavior on color { ColorAnimation { duration: 150 } }
            Behavior on border.color { ColorAnimation { duration: 150 } }
            
            Text {
                anchors.centerIn: parent
                color: activeMenu === "volume" ? "#3584e4" : "#dedede"
                font.pixelSize: 16
                text: "󰕾"
                
                Behavior on color { ColorAnimation { duration: 150 } }
            }
            
            MouseArea {
                id: volumeMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    activeMenu = activeMenu === "volume" ? "" : "volume"
                }
            }
        }
        
        // Bluetooth Button
        Rectangle {
            id: bluetoothButton
            width: 28
            height: 28
            color: bluetoothMouseArea.containsMouse || activeMenu === "bluetooth" ? "#2a2a2a" : "transparent"
            radius: 8
            border.color: activeMenu === "bluetooth" ? "#3584e4" : "transparent"
            border.width: 1
            
            Behavior on color { ColorAnimation { duration: 150 } }
            Behavior on border.color { ColorAnimation { duration: 150 } }
            
            Text {
                anchors.centerIn: parent
                color: activeMenu === "bluetooth" ? "#3584e4" : "#dedede"
                font.pixelSize: 16
                text: "󰂯"
                
                Behavior on color { ColorAnimation { duration: 150 } }
            }
            
            MouseArea {
                id: bluetoothMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    activeMenu = activeMenu === "bluetooth" ? "" : "bluetooth"
                }
            }
        }
        
        // WiFi Button
        Rectangle {
            id: wifiButton
            width: 28
            height: 28
            color: wifiMouseArea.containsMouse || activeMenu === "wifi" ? "#2a2a2a" : "transparent"
            radius: 8
            border.color: activeMenu === "wifi" ? "#3584e4" : "transparent"
            border.width: 1
            
            Behavior on color { ColorAnimation { duration: 150 } }
            Behavior on border.color { ColorAnimation { duration: 150 } }
            
            Text {
                anchors.centerIn: parent
                color: activeMenu === "wifi" ? "#3584e4" : "#dedede"
                font.pixelSize: 14
                text: ""
                
                Behavior on color { ColorAnimation { duration: 150 } }
            }
            
            MouseArea {
                id: wifiMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    activeMenu = activeMenu === "wifi" ? "" : "wifi"
                }
            }
        }
        
        // Power Mode Button
        Rectangle {
            id: powerModeButton
            width: 28
            height: 28
            color: powerModeMouseArea.containsMouse || activeMenu === "power" ? "#2a2a2a" : "transparent"
            radius: 8
            border.color: activeMenu === "power" ? "#3584e4" : "transparent"
            border.width: 1
            
            Behavior on color { ColorAnimation { duration: 150 } }
            Behavior on border.color { ColorAnimation { duration: 150 } }
            
            Text {
                anchors.centerIn: parent
                color: activeMenu === "power" ? "#3584e4" : "#dedede"
                font.pixelSize: 14
                text: "󱪉"
                
                Behavior on color { ColorAnimation { duration: 150 } }
            }
            
            MouseArea {
                id: powerModeMouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    activeMenu = activeMenu === "power" ? "" : "power"
                }
            }
        }
    }
    
    // Volume Slider Panel
    Rectangle {
        id: volumePanel
        width: 50
        height: 180
        color: "#0c0c0c"
        radius: 12
        border.color: "#2e2e2e"
        border.width: 1
        visible: activeMenu === "volume"
        opacity: visible ? 1 : 0
        
        anchors.right: dock.left
        anchors.rightMargin: 12
        anchors.verticalCenter: dock.verticalCenter
        
        Behavior on opacity {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }
        
        Column {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 8
            
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                color: "#3584e4"
                font.pixelSize: 14
                font.bold: true
                text: volumeSlider.value.toFixed(0) + "%"
            }
            
            Slider {
                id: volumeSlider
                orientation: Qt.Vertical
                from: 0
                to: 100
                value: 50
                height: parent.height - 30
                anchors.horizontalCenter: parent.horizontalCenter
                
                background: Rectangle {
                    x: volumeSlider.leftPadding + volumeSlider.availableWidth / 2 - width / 2
                    y: volumeSlider.topPadding
                    implicitWidth: 6
                    implicitHeight: 100
                    width: implicitWidth
                    height: volumeSlider.availableHeight
                    radius: 3
                    color: "#2a2a2a"
                    
                    Rectangle {
                        width: parent.width
                        height: volumeSlider.visualPosition * parent.height
                        color: "#3584e4"
                        radius: 3
                        anchors.bottom: parent.bottom
                    }
                }
                
                handle: Rectangle {
                    x: volumeSlider.leftPadding + volumeSlider.availableWidth / 2 - width / 2
                    y: volumeSlider.topPadding + volumeSlider.visualPosition * (volumeSlider.availableHeight - height)
                    implicitWidth: 18
                    implicitHeight: 18
                    radius: 9
                    color: volumeSlider.pressed ? "#2970c8" : "#3584e4"
                    border.color: "#dedede"
                    border.width: 2
                    
                    Behavior on color {
                        ColorAnimation { duration: 100 }
                    }
                }
            }
        }
    }
    
    // Bluetooth Panel
    Rectangle {
        id: bluetoothPanel
        width: 220
        height: 170
        color: "#0c0c0c"
        radius: 12
        border.color: "#2e2e2e"
        border.width: 1
        visible: activeMenu === "bluetooth"
        opacity: visible ? 1 : 0
        
        anchors.right: dock.left
        anchors.rightMargin: 12
        anchors.verticalCenter: dock.verticalCenter
        
        Behavior on opacity {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }
        
        Column {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 12
            
            Row {
                width: parent.width
                spacing: 8
                
                Text {
                    color: "#3584e4"
                    font.pixelSize: 15
                    font.bold: true
                    text: "󰂯"
                }
                
                Text {
                    color: "#dedede"
                    font.pixelSize: 14
                    font.bold: true
                    text: "Bluetooth"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
            Rectangle {
                width: parent.width
                height: 1
                color: "#2a2a2a"
            }
            
            Row {
                width: parent.width
                spacing: 10
                
                Text {
                    color: "#9a9a9a"
                    font.pixelSize: 12
                    text: "Enabled"
                    anchors.verticalCenter: parent.verticalCenter
                }
                
                Item { width: 1; height: 1 }
                
                Rectangle {
                    width: 44
                    height: 22
                    radius: 11
                    color: bluetoothEnabled ? "#3584e4" : "#2a2a2a"
                    
                    property bool bluetoothEnabled: true
                    
                    Behavior on color {
                        ColorAnimation { duration: 200 }
                    }
                    
                    Rectangle {
                        width: 18
                        height: 18
                        radius: 9
                        color: "#ffffff"
                        x: parent.bluetoothEnabled ? parent.width - width - 2 : 2
                        anchors.verticalCenter: parent.verticalCenter
                        
                        Behavior on x {
                            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
                        }
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: parent.bluetoothEnabled = !parent.bluetoothEnabled
                    }
                }
            }
            
            Text {
                color: "#9a9a9a"
                font.pixelSize: 11
                text: "Devices"
            }
            
            Rectangle {
                width: parent.width
                height: 35
                color: "#080808"
                radius: 8
                border.color: "#2a2a2a"
                border.width: 1
                
                Row {
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10
                    
                    Text {
                        color: "#3584e4"
                        font.pixelSize: 14
                        text: "󰋋"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    
                    Text {
                        color: "#dedede"
                        font.pixelSize: 12
                        text: "Headphones"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
                
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onEntered: parent.border.color = "#3584e4"
                    onExited: parent.border.color = "#2a2a2a"
                }
            }
        }
    }
    
    // WiFi Panel
    Rectangle {
        id: wifiPanel
        width: 220
        height: 200
        color: "#0c0c0c"
        radius: 12
        border.color: "#2e2e2e"
        border.width: 1
        visible: activeMenu === "wifi"
        opacity: visible ? 1 : 0
        
        anchors.right: dock.left
        anchors.rightMargin: 12
        anchors.verticalCenter: dock.verticalCenter
        
        Behavior on opacity {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }
        
        Column {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 12
            
            Row {
                width: parent.width
                spacing: 8
                
                Text {
                    color: "#3584e4"
                    font.pixelSize: 15
                    font.bold: true
                    text: ""
                }
                
                Text {
                    color: "#dedede"
                    font.pixelSize: 14
                    font.bold: true
                    text: "WiFi"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
            Rectangle {
                width: parent.width
                height: 1
                color: "#2a2a2a"
            }
            
            Row {
                width: parent.width
                spacing: 10
                
                Text {
                    color: "#9a9a9a"
                    font.pixelSize: 12
                    text: "Enabled"
                    anchors.verticalCenter: parent.verticalCenter
                }
                
                Item { width: 1; height: 1 }
                
                Rectangle {
                    width: 44
                    height: 22
                    radius: 11
                    color: wifiEnabled ? "#3584e4" : "#2a2a2a"
                    
                    property bool wifiEnabled: true
                    
                    Behavior on color {
                        ColorAnimation { duration: 200 }
                    }
                    
                    Rectangle {
                        width: 18
                        height: 18
                        radius: 9
                        color: "#ffffff"
                        x: parent.wifiEnabled ? parent.width - width - 2 : 2
                        anchors.verticalCenter: parent.verticalCenter
                        
                        Behavior on x {
                            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
                        }
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: parent.wifiEnabled = !parent.wifiEnabled
                    }
                }
            }
            
            Text {
                color: "#9a9a9a"
                font.pixelSize: 11
                text: "Networks"
            }
            
            Column {
                width: parent.width
                spacing: 6
                
                Repeater {
                    model: ["Home WiFi", "Office Network", "Guest"]
                    
                    Rectangle {
                        width: parent.width
                        height: 35
                        color: networkMouseArea.containsMouse ? "#080808" : "transparent"
                        radius: 8
                        border.color: networkMouseArea.containsMouse ? "#3584e4" : "#2a2a2a"
                        border.width: 1
                        
                        Behavior on color { ColorAnimation { duration: 150 } }
                        Behavior on border.color { ColorAnimation { duration: 150 } }
                        
                        Row {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 10
                            
                            Text {
                                color: "#3584e4"
                                font.pixelSize: 12
                                text: ""
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            
                            Text {
                                color: "#dedede"
                                font.pixelSize: 11
                                text: modelData
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        
                        MouseArea {
                            id: networkMouseArea
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                        }
                    }
                }
            }
        }
    }
    
    // Power Mode Panel
    Rectangle {
        id: powerPanel
        width: 200
        height: 140
        color: "#0c0c0c"
        radius: 12
        border.color: "#2e2e2e"
        border.width: 1
        visible: activeMenu === "power"
        opacity: visible ? 1 : 0
        
        anchors.right: dock.left
        anchors.rightMargin: 12
        anchors.verticalCenter: dock.verticalCenter
        
        Behavior on opacity {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }
        
        Column {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 12
            
            Row {
                width: parent.width
                spacing: 8
                
                Text {
                    color: "#3584e4"
                    font.pixelSize: 15
                    font.bold: true
                    text: "󱪉"
                }
                
                Text {
                    color: "#dedede"
                    font.pixelSize: 14
                    font.bold: true
                    text: "Power Mode"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            
            Rectangle {
                width: parent.width
                height: 1
                color: "#2a2a2a"
            }
            
            Column {
                width: parent.width
                spacing: 6
                
                Repeater {
                    model: ["Performance", "Balanced", "Power Saver"]
                    
                    Rectangle {
                        width: parent.width
                        height: 28
                        color: powerModeItemMouseArea.containsMouse ? "#080808" : "transparent"
                        radius: 8
                        border.color: powerModeItemMouseArea.containsMouse ? "#3584e4" : "#2a2a2a"
                        border.width: 1
                        
                        Behavior on color { ColorAnimation { duration: 150 } }
                        Behavior on border.color { ColorAnimation { duration: 150 } }
                        
                        Text {
                            anchors.left: parent.left
                            anchors.leftMargin: 12
                            anchors.verticalCenter: parent.verticalCenter
                            color: "#dedede"
                            font.pixelSize: 11
                            text: modelData
                        }
                        
                        MouseArea {
                            id: powerModeItemMouseArea
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                        }
                    }
                }
            }
        }
    }
}
