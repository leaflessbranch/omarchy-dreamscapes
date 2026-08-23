# Dream Terminal Pack

Theme-aware terminal identity for Dreamscapes:

- `dreamfetch` runs Fastfetch with a different original ASCII artifact for each world and the active theme accent.
- `dreamscapes-prompt` supplies a compact world/phase indicator.
- A guarded Starship custom module adds that indicator to the prompt while retaining the user's existing configuration.

## Install

```bash
./expansion-packs/dream-terminal/install
```

Run `dreamfetch` in any terminal. Starship picks up the custom module on the next prompt.

## Remove

```bash
./expansion-packs/dream-terminal/uninstall
```

The installer backs up `~/.config/starship.toml` before changing it. Removal deletes only the marked Dreamscapes block and retains backups under `~/.local/state/omarchy-dreamscapes/backups/`.
