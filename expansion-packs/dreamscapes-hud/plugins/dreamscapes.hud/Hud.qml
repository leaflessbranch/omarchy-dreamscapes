import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "dreamscapes.hud"

  property string themeName: "unknown"
  property string temporalPhase: "static"
  property date displayDate: clock.date

  function metadata(name) {
    switch (name) {
    case "abyssal-cartographer": return { sigil: "⌖", code: "ABYSS", name: "Abyssal Cartographer" }
    case "xenobotany-lab-no-7": return { sigil: "⚗", code: "XENO-7", name: "Xenobotany Lab No. 7" }
    case "solar-relic": return { sigil: "☉", code: "RELIC", name: "Solar Relic" }
    case "dream-bureaucracy": return { sigil: "▤", code: "FORM-9", name: "Dream Bureaucracy" }
    case "cathedral-of-static": return { sigil: "⌁", code: "NAVE", name: "Cathedral of Static" }
    case "cryogenic-orchard": return { sigil: "❄", code: "ORCHARD", name: "Cryogenic Orchard" }
    case "apollo-after-dark": return { sigil: "◐", code: "APOLLO", name: "Apollo After Dark" }
    case "living-ink": return { sigil: "◒", code: "INK", name: "Living Ink" }
    case "neon-fossil": return { sigil: "◉", code: "FOSSIL", name: "Neon Fossil" }
    case "the-impossible-hotel": return { sigil: "⌑", code: "ROOM-∞", name: "The Impossible Hotel" }
    default: return { sigil: "◇", code: "STATIC", name: name.replace(/-/g, " ") }
    }
  }

  function phaseGlyph(phase) {
    switch (phase) {
    case "dawn": return "◔"
    case "day": return "●"
    case "dusk": return "◕"
    case "midnight": return "○"
    default: return "·"
    }
  }

  readonly property var identity: metadata(themeName)
  readonly property string clockText: Qt.formatDateTime(displayDate, "HH:mm")
  readonly property string horizontalText: identity.sigil + "  " + identity.code + "  " + phaseGlyph(temporalPhase) + " " + temporalPhase.toUpperCase() + "  " + clockText

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  FileView {
    id: themeFile
    path: Quickshell.env("HOME") + "/.local/state/omarchy/current/theme.name"
    watchChanges: true
    printErrors: false
    onLoaded: root.themeName = String(text()).trim()
    onFileChanged: reload()
  }

  FileView {
    id: phaseFile
    path: Quickshell.env("HOME") + "/.local/state/omarchy-dreamscapes/temporal.phase"
    watchChanges: true
    printErrors: false
    onLoaded: root.temporalPhase = String(text()).trim() || "static"
    onFileChanged: reload()
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
    onDateChanged: root.displayDate = date
  }

  IpcHandler {
    target: "dreamscapes.hud"
    function refresh(): void {
      themeFile.reload()
      phaseFile.reload()
      root.displayDate = new Date()
    }
  }

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.vertical ? root.identity.sigil : root.horizontalText
    active: true
    activeColor: Color.accent
    tooltipText: root.identity.name + " · " + root.temporalPhase + "\nLeft: themes · Middle: next world · Right: next phase"
    horizontalMargin: 10
    verticalPadding: 7

    onPressed: function(mouseButton) {
      if (!root.bar) return
      if (mouseButton === Qt.RightButton) root.bar.run("dreamscapes-temporal cycle")
      else if (mouseButton === Qt.MiddleButton) root.bar.run("omarchy-theme-cycle-dreamscapes")
      else root.bar.run("omarchy theme switcher")
    }
  }

  Rectangle {
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.leftMargin: 8
    anchors.rightMargin: 8
    height: 2
    radius: 1
    color: Color.accent

    SequentialAnimation on opacity {
      loops: Animation.Infinite
      NumberAnimation { from: 0.25; to: 0.95; duration: 1300; easing.type: Easing.InOutSine }
      NumberAnimation { from: 0.95; to: 0.25; duration: 1300; easing.type: Easing.InOutSine }
    }
  }
}
