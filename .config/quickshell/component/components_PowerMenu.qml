import QtQuick
import Quickshell
import Quickshell.Hyprland

PanelWindow {
  id: powerMenuRoot

  property bool isVisible: false

  anchors { 
    bottom: true
    left: true
  }
  margins {
    bottom: 0
    left: 5
  }
  exclusiveZone: 0 
  color: "transparent"
  visible: isVisible
  implicitHeight: 170
  implicitWidth: 60

  // Backdrop
  Rectangle {
    anchors.fill: parent
    color: "transparent"

    MouseArea {
      anchors.fill: parent
      onClicked: isVisible = false
    }
  }

  // Main menu container
  Rectangle {
    width: 60
    height: 260
    color: "#0c0c0c"
    radius: 5

    Column {
      anchors.fill: parent
      anchors.margins: 5
      spacing: 5


      // Shutdown Button
      Rectangle {
        width: parent.width
        height: 50
        color: shutdownMouseArea.containsMouse ? "#e05c5c" : "#2a2a2a"
        radius: 12

        Behavior on color {
          ColorAnimation { duration: 200 }
        }

        Column {
          anchors.centerIn: parent
          spacing: 4

          Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: shutdownMouseArea.containsMouse ? "#0c0c0c" : "#dedede"
            font.pixelSize: 24
            text: "󰐥"

            Behavior on color {
              ColorAnimation { duration: 200 }
            }
          }
        }

        MouseArea {
          id: shutdownMouseArea
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          hoverEnabled: true
          onClicked: {
            console.log("Shutting down...")
            isVisible = false
          }
        }
      }

      // Restart Button
      Rectangle {
        width: parent.width
        height: 50
        color: restartMouseArea.containsMouse ? "#3584e4" : "#2a2a2a"
        radius: 12

        Behavior on color {
          ColorAnimation { duration: 200 }
        }

        Column {
          anchors.centerIn: parent
          spacing: 4

          Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: restartMouseArea.containsMouse ? "#0c0c0c" : "#dedede"
            font.pixelSize: 24
            text: "󰜉"

            Behavior on color {
              ColorAnimation { duration: 200 }
            }
          }
        }

        MouseArea {
          id: restartMouseArea
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          hoverEnabled: true
          onClicked: {
            console.log("Restarting...")
            isVisible = false
          }
        }
      }

      // Logout Button
      Rectangle {
        width: parent.width
        height: 50
        color: logoutMouseArea.containsMouse ? "#d4a256" : "#2a2a2a"
        radius: 12

        Behavior on color {
          ColorAnimation { duration: 200 }
        }

        Column {
          anchors.centerIn: parent
          spacing: 4

          Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: logoutMouseArea.containsMouse ? "#0c0c0c" : "#dedede"
            font.pixelSize: 24
            text: "󰍃"

            Behavior on color {
              ColorAnimation { duration: 200 }
            }
          }               
        }

        MouseArea {
          id: logoutMouseArea
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          hoverEnabled: true
          onClicked: {
            console.log("Logging out...")
            isVisible = false
          }
        }
      }
    }
  }
}
