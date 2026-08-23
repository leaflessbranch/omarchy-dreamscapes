# Ritual Boot Pack

Ten transparent geometric unlock emblems—one for each Dreamscapes world—plus matching Plymouth preview assets in every theme repository.

The emblems are code-native SVG designs rasterized to Omarchy's 800×188 transparent `unlock.png` format. Nothing is applied to the privileged boot configuration automatically.

## Install user assets

```bash
./expansion-packs/ritual-boot/install
```

This updates installed Dreamscapes theme folders after creating backups. To explicitly apply the active world's boot ritual:

```bash
dreamscapes-ritual apply
```

That command delegates to `omarchy plymouth set by theme` and may request authentication because it changes the system boot screen.

Generate a temporary preview instead:

```bash
dreamscapes-ritual preview neon-fossil /tmp/neon-fossil-boot.png
```

## Remove

```bash
./expansion-packs/ritual-boot/uninstall
```

Removal restores the backed-up unlock assets. It does not change the currently installed Plymouth system theme; use `omarchy plymouth reset` explicitly if desired.
