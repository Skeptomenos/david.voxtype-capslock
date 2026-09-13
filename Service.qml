import QtQuick
import Quickshell
import Quickshell.Io

Item {
  id: root

  property var shell: null
  property var manifest: null

  readonly property string pluginDir: {
    const home = Quickshell.env("HOME")
    return home + "/.config/omarchy/plugins/david.voxtype-capslock"
  }
  readonly property string ledBin: pluginDir + "/bin/voxtype-capslock-led"

  function ledOff() {
    offProcess.command = [root.ledBin, "--off"]
    offProcess.running = true
  }

  Process {
    id: followProcess
    command: [root.ledBin]
    running: true
  }

  Process {
    id: offProcess
  }

  IpcHandler {
    target: "david.voxtype-capslock"

    function status(): string {
      return JSON.stringify({
        running: followProcess.running,
        ledBin: root.ledBin
      })
    }
  }

  Component.onDestruction: root.ledOff()
}
