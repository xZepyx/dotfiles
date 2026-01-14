import qs.services
import qs.config
import qs.modules.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

Scope {
    id: root
    property bool imageFailed: false

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            id: clock

            color: "transparent"
            visible: (Config.runtime.appearance.background.clock.enabled && Config.initialized && !imageFailed)
            exclusiveZone: 0
            WlrLayershell.layer: WlrLayer.Bottom
            screen: modelData

            implicitWidth: 360
            implicitHeight: 160

            property int padding: 50

            anchors {
                top: Config.runtime.appearance.background.clock.position.startsWith("top") // Simple way to get anchors
                bottom: Config.runtime.appearance.background.clock.position.startsWith("bottom")
                left: Config.runtime.appearance.background.clock.position.endsWith("left")
                right: Config.runtime.appearance.background.clock.position.endsWith("right")
            }

            margins {
                top: padding
                bottom: padding
                left: padding
                right: padding
            }

            Column {
                anchors.fill: parent
                spacing: -40

                StyledText {
                    animate: false
                    text: Time.format("hh:mm")
                    font.pixelSize: Appearance.font.size.wildass * 3
                    font.family: Appearance.font.family.main
                    font.bold: true
                }

                StyledText {
                    anchors.left: parent.left 
                    anchors.leftMargin: 8
                    animate: false
                    text: Time.format("dddd, dd/MM")
                    font.pixelSize: 32
                    font.family: Appearance.font.family.main
                    font.bold: true
                }
            }
        }
    }
}
