import QtQuick
import Quickshell
import Quickshell.Io
import qs.config
pragma Singleton

Singleton {
    id: root
    property var map: ({
    })

    function notifyMissingVariant(theme, variant) {
        Quickshell.execDetached(["notify-send", "Nucleus Shell", `Theme '${theme}' does not have a ${variant} variant.`, "--urgency=normal", "--expire-time=5000"]);
    }

    Timer {
        interval: 5000
        repeat: true 
        running: true 
        onTriggered: loadThemes.running = true
    }

    Process {
        id: loadThemes

        command: ["ls", Directories.shellConfig + "/colorschemes"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const map = {
                };
                text.split("\n").map((t) => {
                    return t.trim();
                }).filter((t) => {
                    return t.endsWith(".json");
                }).forEach((t) => {
                    const name = t.replace(/\.json$/, "");
                    const parts = name.split("-");
                    const variant = parts.pop();
                    const base = parts.join("-");
                    if (!map[base])
                        map[base] = {
                    };

                    map[base][variant] = name;
                });
                root.map = map;
            }
        }

    }

}
