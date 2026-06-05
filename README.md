# CapsLock Vim Layer - AutoHotkey v2

## About

This AutoHotkey v2 script repurposes the CapsLock key as a toggle to activate a Vim-inspired keyboard layer. When the layer is active, common Vim-style navigation keys are available, and the Escape key is remapped to close the active window.

---

## Requirements

- [AutoHotkey v2.0](https://www.autohotkey.com/) or later

---

## How It Works

### CapsLock Toggle

| Action | Result |
|---|---|
| Press `CapsLock` | Toggles the Vim layer **ON** or **OFF** |
| Tooltip | Displays "Vim Layer: ON" or "Vim Layer: OFF" for 2 seconds |

> CapsLock's native function (toggling capitalization) is permanently disabled. The LED will never light up.

---

### Layer OFF (Default)

All keys behave normally. No remapping is active.

---

### Layer ON (Vim Layer Active)

#### Window Management

| Key | Action |
|---|---|
| `Escape` | Sends `Alt+F4` closes the active window |

#### Arrow Movement

| Key | Action |
|---|---|
| `h` | ← Left |
| `j` | ↓ Down |
| `k` | ↑ Up |
| `l` | → Right |

> Modifier passthrough is supported via `{Blind}` mode:
> - `Shift` + key → Select text in that direction
> - `Ctrl` + key → Jump by word/paragraph
> - `Ctrl+Shift` + key → Select by word/paragraph

#### Word Navigation

| Key | Action |
|---|---|
| `w` | `Ctrl+Right` Move to next word |
| `b` | `Ctrl+Left`  Move to previous word |

> Shift passthrough is supported:
> - `Shift+w` → Select to next word
> - `Shift+b` → Select to previous word

#### Page Navigation

| Key | Action |
|---|---|
| `u` | Page Up |
| `d` | Page Down |

> Shift passthrough is supported:
> - `Shift+u` → Select Page Up
> - `Shift+d` → Select Page Down

---

## Notes

- The `*` (wildcard) prefix is used on all hotkeys so they fire regardless of held modifiers.
- `{Blind}` mode ensures held modifiers (Shift, Ctrl, Alt) are passed through to the output key automatically.
- CapsLock state is forced to `AlwaysOff` to prevent accidental capitalization.
- Only one instance of the script can run at a time (`#SingleInstance Force` behavior via `#Requires`).

---

## Quick Reference

CapsLock → Toggle Vim Layer ON/OFF

--- Layer ON ---

Escape → Alt+F4 (close window)

h / j / k / l → ← ↓ ↑ →

w / b → Next Word / Previous Word

u / d → Page Up / Page Down

All keys support Shift/Ctrl/Alt passthrough.
