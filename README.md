# Omarchy Dreamscapes

Ten original Omarchy themes built as tiny worlds rather than palette swaps. Every theme includes a complete generated color system, two original wallpapers, coordinated lock-screen styling, and an icon-theme selection.

## The collection

| Theme | Mode | Install |
| --- | --- | --- |
| [Abyssal Cartographer](https://github.com/leaflessbranch/omarchy-abyssal-cartographer-theme) | Dark | `omarchy theme install https://github.com/leaflessbranch/omarchy-abyssal-cartographer-theme.git` |
| [Xenobotany Lab No. 7](https://github.com/leaflessbranch/omarchy-xenobotany-lab-no-7-theme) | Dark | `omarchy theme install https://github.com/leaflessbranch/omarchy-xenobotany-lab-no-7-theme.git` |
| [Solar Relic](https://github.com/leaflessbranch/omarchy-solar-relic-theme) | Dark | `omarchy theme install https://github.com/leaflessbranch/omarchy-solar-relic-theme.git` |
| [Dream Bureaucracy](https://github.com/leaflessbranch/omarchy-dream-bureaucracy-theme) | Light | `omarchy theme install https://github.com/leaflessbranch/omarchy-dream-bureaucracy-theme.git` |
| [Cathedral of Static](https://github.com/leaflessbranch/omarchy-cathedral-of-static-theme) | Dark | `omarchy theme install https://github.com/leaflessbranch/omarchy-cathedral-of-static-theme.git` |
| [Cryogenic Orchard](https://github.com/leaflessbranch/omarchy-cryogenic-orchard-theme) | Light | `omarchy theme install https://github.com/leaflessbranch/omarchy-cryogenic-orchard-theme.git` |
| [Apollo After Dark](https://github.com/leaflessbranch/omarchy-apollo-after-dark-theme) | Dark | `omarchy theme install https://github.com/leaflessbranch/omarchy-apollo-after-dark-theme.git` |
| [Living Ink](https://github.com/leaflessbranch/omarchy-living-ink-theme) | Light | `omarchy theme install https://github.com/leaflessbranch/omarchy-living-ink-theme.git` |
| [Neon Fossil](https://github.com/leaflessbranch/omarchy-neon-fossil-theme) | Dark | `omarchy theme install https://github.com/leaflessbranch/omarchy-neon-fossil-theme.git` |
| [The Impossible Hotel](https://github.com/leaflessbranch/omarchy-the-impossible-hotel-theme) | Dark | `omarchy theme install https://github.com/leaflessbranch/omarchy-the-impossible-hotel-theme.git` |

### Abyssal Cartographer

![Abyssal Cartographer](gallery/abyssal-cartographer.png)

### Xenobotany Lab No. 7

![Xenobotany Lab No. 7](gallery/xenobotany-lab-no-7.png)

### Solar Relic

![Solar Relic](gallery/solar-relic.png)

### Dream Bureaucracy

![Dream Bureaucracy](gallery/dream-bureaucracy.png)

### Cathedral of Static

![Cathedral of Static](gallery/cathedral-of-static.png)

### Cryogenic Orchard

![Cryogenic Orchard](gallery/cryogenic-orchard.png)

### Apollo After Dark

![Apollo After Dark](gallery/apollo-after-dark.png)

### Living Ink

![Living Ink](gallery/living-ink.png)

### Neon Fossil

![Neon Fossil](gallery/neon-fossil.png)

### The Impossible Hotel

![The Impossible Hotel](gallery/the-impossible-hotel.png)

## Install everything

Review [install-all-themes](install-all-themes), then run:

```bash
./install-all-themes
```

The standard Omarchy installation commands are intentionally preserved: every theme remains independently installable, updateable with `omarchy theme update`, and removable through `omarchy theme remove`.

## Optional Experience Pack

The themes are complete without this. The opt-in [Experience Pack](experience-pack/README.md) adds:

- Theme-specific Hyprland gaps, rounding, blur, borders, and opacity
- Theme-aware workspace labels
- A command and optional keybinding for cycling all ten themes

Its installer backs up every user configuration file it changes and its uninstaller removes only Dreamscapes-owned files.

## Expansion Packs

Five independently removable expansions turn the collection into a complete environment:

| Pack | Effect |
| --- | --- |
| [Temporal Rift](expansion-packs/temporal-rift/README.md) | Dawn, day, dusk, and midnight wallpaper grades with scheduled display temperature |
| [Kinetic Architecture](expansion-packs/kinetic-architecture/README.md) | A distinct Hyprland animation language for every world |
| [Dreamscapes HUD](expansion-packs/dreamscapes-hud/README.md) | Animated bar identity, phase, time, and direct world controls |
| [Dream Terminal](expansion-packs/dream-terminal/README.md) | Theme-aware Fastfetch artifacts and a Starship world/phase module |
| [Ritual Boot](expansion-packs/ritual-boot/README.md) | Transparent unlock emblems and matching Plymouth previews |

Install all five after reviewing the scripts:

```bash
./expansion-packs/install-all
```

Remove all five in reverse order:

```bash
./expansion-packs/uninstall-all
```

Each pack also has its own installer and uninstaller. No GitHub Actions workflows or background network services are included; Temporal Rift uses only a local user-level systemd timer.

## Compatibility

Developed and locally tested with Omarchy 4.0.0-1. The repositories use the modern `colors.toml` theme format.

## Artwork

The original wallpapers were generated with OpenAI image generation and curated by Eddie ([leaflessbranch](https://github.com/leaflessbranch)). Individual artwork terms are included in each theme repository.

Code in this collection repository is released under the MIT License.
