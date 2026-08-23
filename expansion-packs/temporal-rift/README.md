# Temporal Rift Pack

Every Dreamscapes world now has four time states: dawn, day, dusk, and midnight. The active phase changes its wallpaper grade and display temperature without rewriting the theme palette.

## Schedule

| Phase | Hours | Temperature |
| --- | --- | --- |
| Dawn | 05:00–08:59 | 5200 K |
| Day | 09:00–16:59 | Identity / native |
| Dusk | 17:00–20:59 | 4600 K |
| Midnight | 21:00–04:59 | 3800 K |

The included user-level systemd timer checks every 15 minutes. A theme hook applies the correct phase immediately after switching themes.

## Install

Review and run:

```bash
./expansion-packs/temporal-rift/install
```

Manual controls:

```bash
dreamscapes-temporal status
dreamscapes-temporal apply dawn
dreamscapes-temporal apply auto
dreamscapes-temporal cycle
```

## Remove

```bash
./expansion-packs/temporal-rift/uninstall
```

Removal restores the background that was active before installation when it is still available, disables the timer, and returns `hyprsunset` to identity.

The temporal images are color-graded derivatives of the collection's original wallpapers and retain their CC BY 4.0 terms.
