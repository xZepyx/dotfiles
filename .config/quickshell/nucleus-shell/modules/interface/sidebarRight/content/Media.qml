import Qt5Compat.GraphicalEffects
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets 
import Quickshell.Io
import qs.config
import qs.modules.functions
import qs.modules.interface.notifications
import qs.modules.widgets
import qs.services

StyledRect {
    id: root

    Layout.fillWidth: true
    radius: Appearance.rounding.normal
    color: Appearance.m3colors.m3surfaceContainer

    ClippingRectangle {
        color: Appearance.colors.colLayer1
        radius: Appearance.rounding.normal
        implicitHeight: 90
        anchors.fill: parent

        RowLayout {
            anchors.fill: parent
            spacing: Appearance.margin.small

            // Artwork
            ClippingRectangle {
                implicitWidth: 140
                implicitHeight: 140
                Layout.leftMargin: Appearance.margin.large
                radius: Appearance.rounding.normal
                clip: true
                color: Appearance.colors.colLayer2

                Image {
                    anchors.fill: parent
                    source: Mpris.artUrl
                    fillMode: Image.PreserveAspectCrop
                    cache: true
                }

            }

            ColumnLayout {
                Layout.fillWidth: true
                Layout.rightMargin: Appearance.margin.small
                spacing: 2

                // Title
                Text {
                    text: Mpris.albumTitle
                    elide: Text.ElideRight
                    Layout.maximumWidth: 190
                    font.family: Appearance.font.family.title
                    font.pixelSize: Appearance.font.size.hugeass
                    font.bold: true
                    color: Appearance.colors.colOnLayer2
                }

                // Artist
                Text {
                    text: Mpris.albumArtist
                    elide: Text.ElideRight
                    Layout.maximumWidth: 160
                    font.family: Appearance.font.family.main
                    font.pixelSize: Appearance.font.size.normal
                    color: Appearance.colors.colSubtext
                }

                // Controls
                RowLayout {

                    Layout.fillWidth: true
                    spacing: 12

                    Process {
                        id: control
                    }

                    Button {
                        Layout.preferredWidth: 36
                        Layout.preferredHeight: 36
                        onClicked: Quickshell.execDetached(["playerctl", "previous"])

                        background: Rectangle {
                            radius: Appearance.rounding.large
                            color: Appearance.colors.colLayer2
                        }

                        contentItem: MaterialSymbol {
                            anchors.centerIn: parent
                            icon: "skip_previous"
                            font.pixelSize: 24
                            color: Appearance.colors.colOnLayer2
                            fill: 1
                        }

                    }

                    Button {
                        Layout.preferredWidth: 42
                        Layout.preferredHeight: 42
                        onClicked: Quickshell.execDetached(["playerctl", "play-pause"])

                        background: Rectangle {
                            radius: Appearance.rounding.full
                            color: Appearance.colors.colPrimary
                        }

                        contentItem: MaterialSymbol {
                            anchors.bottom: parent.bottom
                            anchors.top: parent.top
                            icon: "play_arrow"
                            font.pixelSize: 36
                            color: Appearance.colors.colOnPrimary
                            fill: 1
                            
                        }

                    }

                    Button {
                        Layout.preferredWidth: 36
                        Layout.preferredHeight: 36
                        onClicked: Quickshell.execDetached(["playerctl", "next"])

                        background: Rectangle {
                            radius: Appearance.rounding.large
                            color: Appearance.colors.colLayer2
                        }

                        contentItem: MaterialSymbol {
                            anchors.centerIn: parent
                            icon: "skip_next"
                            font.pixelSize: 24
                            color: Appearance.colors.colOnLayer2
                            fill: 1
                            
                        }

                    }

                }

                // Timeline
                RowLayout {
                    Layout.topMargin: 15
                    Layout.fillWidth: true
                    spacing: 12

                    Text {
                        text: Mpris.formatTime(Mpris.positionSec)
                        font.pixelSize: Appearance.font.size.smallest
                        color: Appearance.colors.colSubtext
                    }

                    Item {
                        Layout.fillWidth: true
                        implicitHeight: 20

                        Rectangle {
                            anchors.fill: parent
                            radius: Appearance.rounding.full
                            color: Appearance.colors.colLayer2
                        }

                        Rectangle {
                            width: parent.width * (Mpris.lengthSec > 0 ? Mpris.positionSec / Mpris.lengthSec : 0)
                            radius: Appearance.rounding.full
                            color: Appearance.colors.colPrimary

                            anchors {
                                left: parent.left
                                top: parent.top
                                bottom: parent.bottom
                            }

                        }

                    }

                    Text {
                        text: Mpris.formatTime(Mpris.lengthSec)
                        font.pixelSize: Appearance.font.size.smallest
                        color: Appearance.colors.colSubtext
                    }

                }

            }

        }

    }

}
