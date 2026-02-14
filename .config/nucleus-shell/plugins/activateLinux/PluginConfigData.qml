pragma Singleton
import QtQuick

QtObject {
    readonly property string pluginName: "activateLinux"
    readonly property var defaults: ({
        enabled: true
    })
}
