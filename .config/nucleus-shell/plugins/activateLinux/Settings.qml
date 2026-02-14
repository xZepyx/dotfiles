import QtQuick
import QtQuick.Layouts
import qs.plugins
import qs.modules.components

ColumnLayout {
    spacing: 15
    StyledText {
        text: "Activate Linux - Plugin"
        font.pixelSize: 20
        font.bold: true
    }

    StyledSwitchOption {
        title: "Enabled"
        description: "Enable or disable ActivateLinux Plugin."
        prefField: "plugins.activateLinux.enabled"
    }
}

