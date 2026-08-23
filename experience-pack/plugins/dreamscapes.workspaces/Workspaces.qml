import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "omarchy.workspaces"

  property string themeName: "default"

  function labelsForTheme(name) {
    switch (name) {
    case "abyssal-cartographer":
      return ["Ⅰ", "Ⅱ", "Ⅲ", "Ⅳ", "Ⅴ", "Ⅵ", "Ⅶ", "Ⅷ", "Ⅸ", "Ⅹ"]
    case "xenobotany-lab-no-7":
      return ["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "κ"]
    case "solar-relic":
      return ["☿", "♀", "⊕", "♂", "♃", "♄", "♅", "♆", "♇", "✦"]
    case "dream-bureaucracy":
      return ["IN", "AR", "PR", "RV", "EX", "HR", "QA", "RD", "MT", "ZZ"]
    case "cathedral-of-static":
      return ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"]
    case "cryogenic-orchard":
      return ["·", "◇", "◈", "❄", "✦", "✧", "○", "◎", "◌", "❅"]
    case "apollo-after-dark":
      return ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A0"]
    case "living-ink":
      return ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十"]
    case "neon-fossil":
      return ["H", "A", "P", "C", "O", "S", "D", "K", "J", "R"]
    case "the-impossible-hotel":
      return ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]
    default:
      return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    }
  }

  function labelFor(id) {
    var labels = labelsForTheme(themeName)
    return id >= 1 && id <= labels.length ? labels[id - 1] : String(id)
  }

  function workspaceById(id) {
    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      if (values[i].id === id) return values[i]
    }

    return null
  }

  function workspaceIds() {
    var ids = [1, 2, 3, 4, 5]
    var values = Hyprland.workspaces.values

    for (var i = 0; i < values.length; i++) {
      var id = values[i].id
      if (id > 0 && id <= 10 && ids.indexOf(id) === -1) ids.push(id)
    }

    ids.sort(function(left, right) { return left - right })
    return ids
  }

  function focusWorkspace(id) {
    if (!root.bar) return
    root.bar.run("hyprctl dispatch " + Util.shellQuote("hl.dsp.focus({ workspace = \"" + id + "\" })"))
  }

  readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(1.5)

  FileView {
    id: themeFile
    path: Quickshell.env("HOME") + "/.local/state/omarchy/current/theme.name"
    watchChanges: true
    printErrors: false
    onLoaded: root.themeName = String(text()).trim()
    onFileChanged: reload()
  }

  implicitWidth: grid.implicitWidth + trailingGap
  implicitHeight: grid.implicitHeight

  GridLayout {
    id: grid
    anchors.fill: parent
    anchors.rightMargin: root.trailingGap
    columns: root.vertical ? 1 : root.workspaceIds().length
    columnSpacing: root.vertical ? 0 : Style.space(1)
    rowSpacing: root.vertical ? Style.space(2) : 0

    Repeater {
      model: root.workspaceIds()

      WidgetButton {
        required property int modelData

        readonly property var workspace: root.workspaceById(modelData)
        readonly property bool occupied: workspace !== null && workspace.toplevels.values.length > 0
        readonly property bool focused: Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === modelData

        bar: root.bar
        text: root.labelFor(modelData)
        active: focused
        activeColor: Color.accent
        dimmed: !(occupied || focused)
        tooltipText: "Workspace " + modelData + " · " + root.themeName.replace(/-/g, " ")
        horizontalMargin: 6
        verticalPadding: 6
        fixedWidth: root.vertical ? root.barSize : Style.space(28)
        fixedHeight: root.barSize
        onPressed: function() { root.focusWorkspace(modelData) }
      }
    }
  }
}
