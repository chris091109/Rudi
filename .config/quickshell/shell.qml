import QtQuick
import Quickshell
import Quickshell.Hyprland
import "components"

ShellRoot {
    property bool showPowerMenu: false
    
    PanelWindow {
        id: panel

        anchors {
            left: true
            top: true
            bottom: true
        }

        implicitWidth: 40
        color: "transparent"

        // Glassmorphic background
        Rectangle {
            anchors.fill: parent
            color: "#0c0c0c"
        }

        Column {
            anchors.fill: parent
            anchors.margins: 2
            spacing: 12

            // Workspaces at top
            WorkspaceIndicator {
                id: workspace
                width: parent.width
            }

            // Spacer - will expand to fill remaining space
            Item {
                width: parent.width
                height: Math.max(1, parent.height - workspace.height - tray.height - dock.height - clock.height - power.height - (7 * 12))
            }

            // System Tray
            Tray {
                id: tray
                width: parent.width
              }
            // Clock
            Clock {
                id: clock
                width: parent.width
            }


            // Dock above clock
            Dock {
                id: dock
                width: parent.width
            }

            // Power button at bottom
            Power {
                id: power
                width: parent.width
                onClicked: {
                    showPowerMenu = !showPowerMenu
                }
            }
        }
    }
    
    // Power Menu Component
    PowerMenu {
        id: powerMenu
        isVisible: showPowerMenu
    }
}
