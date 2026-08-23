# Dreamscapes Experience Pack

An optional companion for the ten Omarchy Dreamscapes themes. The themes themselves do not need this pack.

## What it changes

- Installs `dreamscapes.workspaces`, a theme-aware workspace widget cloned from Omarchy's built-in workspaces plugin.
- Adds theme-set and post-boot hooks that apply theme-specific Hyprland geometry and effects.
- Installs `~/.local/bin/omarchy-theme-cycle-dreamscapes`.
- Adds `Super + Shift + Ctrl + T` to the user's Hyprland bindings for cycling the collection.
- Replaces the active workspace widget ID in `~/.config/omarchy/shell.json` with `dreamscapes.workspaces`.

The installer creates timestamped backups under `~/.local/state/omarchy-dreamscapes/backups/` before changing `shell.json` or `bindings.lua`.

## Install

Install the ten themes first. Then review [install](install) and run:

```bash
./experience-pack/install
```

## Remove

Review [uninstall](uninstall) and run:

```bash
./experience-pack/uninstall
```

Removal restores the stock `omarchy.workspaces` widget ID and deletes only Dreamscapes-owned plugin, hook, command, and binding entries. Timestamped backups are retained.
