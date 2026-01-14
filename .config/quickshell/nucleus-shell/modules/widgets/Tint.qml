pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Effects
import qs.config

Item {
    property var sourceItem: null 

    Loader {
        active: Config.runtime.appearance.tintIcons
        anchors.fill: parent
        sourceComponent: MultiEffect {
            source: sourceItem

            saturation: -1.0
            contrast: 0.10
            brightness: -0.08
            blur: 0.0   
        }

    }
}