<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:ff3c50,50:9d4edd,100:00c2ff&height=200&section=header&text=TINFOIL-THEMES&fontSize=54&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=the%20Tinfoil%20theme%20database%20%E2%80%94%20stable%20and%20still%20served&descAlignY=58&descSize=18" width="100%"/>

<img src="https://raw.githubusercontent.com/A-Theme/Theme-App/main/assets/logo.png" width="90" height="90" alt="A-Theme logo"/>

<p>
  <img src="https://img.shields.io/badge/themes-community%20%2B%20original-00c2ff?style=for-the-badge" alt="themes"/>
  <img src="https://img.shields.io/badge/format-Tinfoil%20theme.json-9d4edd?style=for-the-badge" alt="format"/>
</p>

</div>

---

## Welcome to A-Theme

Some of the coolest Tinfoil themes you can find, all in one place. Every
theme's `.zip`, every screenshot, and the `themes.json` manifest that ties
them together live right here, and the Tinfoil editor and the on-console
installer both read this repo directly.

> **Where the project is now.** Tinfoil has largely been overtaken by the
> **RomM Switch client**, and that is where new theming work happens:
> **[RomM-Themes](https://github.com/A-Theme/RomM-Themes)** is the active
> database, with its own editor, its own CI validation, and a
> [sprite sheet maker](https://github.com/A-Theme/RomM-Themes/tree/main/tools/spritesheet-maker)
> for animated backgrounds.
>
> This repo is **stable, not retired**: the themes stay here, `themes.json`
> stays served, and the editor and installer keep working exactly as they do
> today. New themes are still welcome — there is simply more happening on the
> RomM side.

### 🎲 A few themes at random

<!-- SCREENSHOTS:START -->
<div align="center">
<img src="https://raw.githubusercontent.com/A-Theme/Tinfoil-Themes/main/Theme%20Screen%20Shots/2023112816343100_s.jpg" width="320"/>
<img src="https://raw.githubusercontent.com/A-Theme/Tinfoil-Themes/main/Theme%20Screen%20Shots/2023112720410200_s.jpg" width="320"/>
<img src="https://raw.githubusercontent.com/A-Theme/Tinfoil-Themes/main/Theme%20Screen%20Shots/2024031113285000_s.jpg" width="320"/>
</div>
<!-- SCREENSHOTS:END -->

<div align="center">
<div align="center">
<sub>Refreshed automatically every hour by <a href=".github/workflows/rotate-screenshots.yml">a GitHub Action</a> pulling random images straight from <code>Theme Screen Shots/</code> — nothing hand-picked, nothing hardcoded.</sub>
<br/>
<a href="https://github.com/A-Theme/Tinfoil-Themes/actions/workflows/rotate-screenshots.yml"><img src="https://img.shields.io/badge/%F0%9F%94%80-Shuffle%20now-9d4edd?style=for-the-badge" alt="Shuffle now"/></a>
<br/>
<sub><em>(opens the workflow's Actions page — click "Run workflow" there for an instant reshuffle instead of waiting for the next hourly run. Needs write access to this repo.)</em></sub>
</div>
</div>

---

## 🧩 How the whole A-Theme project fits together

Two formats, each with its own database. **RomM** is the live one and has
[its own section below](#-the-romm-side-where-the-work-is-now); the **Tinfoil**
side is these three pieces, where this repo sits underneath the editor and the
on-console installer and neither needs a separate copy of anything.

<table>
<tr>
<td width="33%" valign="top" align="center">

**📦 Tinfoil-Themes**
<br><sub>you are here</sub>

The database itself — every theme's `.zip`, every screenshot, and the
`themes.json` manifest listing them all, hosted right from this repo via
GitHub Pages.

</td>
<td width="33%" valign="top" align="center">

**🎨 [Theme-App](https://github.com/A-Theme/Theme-App)**
<br><sub>edit</sub>

Reads this repo's theme list live. Browse, load, and customize any theme
with real color pickers and palette generation — in a browser, as an
installable app, or as a Windows desktop app.

</td>
<td width="33%" valign="top" align="center">

**🎮 [Switch-Theme-Installer](https://github.com/A-Theme/Switch-Theme-Installer)**
<br><sub>install</sub>

Native Switch homebrew that reads this exact same `themes.json` — browse,
preview, and generate a palette from a theme's own background, all with a
controller, all on-console, straight to your SD card.

</td>
</tr>
</table>

Both tools point at the same `themes.json` and download the same `.zip`
files from this repo — add a theme here once, and it's immediately
browsable from a PC, a phone, or a Switch, with nothing to keep in sync
by hand.

### 🟢 The RomM side, where the work is now

The **RomM Switch client** is a full SDL2 homebrew app rather than a shop, and
themes for it can do considerably more. Separate format, separate database, so
nothing here is affected:

- **[RomM-Themes](https://github.com/A-Theme/RomM-Themes)** — the theme
  database for it. A RomM theme is a *folder* with a `theme.json`, able to
  change 19 semantic colour roles, the background (with motion and sprite-sheet
  animation), the UI font, mascot art, and the music. Every submission is
  validated in CI against the same rules the client itself enforces.
- **[The RomM editor](https://github.com/A-Theme/Theme-App/blob/main/romm-theme-editor.html)**
  — lives in Theme-App beside the Tinfoil one, with a live preview of the real
  client screens, WCAG contrast checks, and a live texture-memory budget for
  animated backgrounds.
- **[spritesheet-maker](https://github.com/A-Theme/RomM-Themes/tree/main/tools/spritesheet-maker)**
  — turns a GIF, a video or a single still image into an animated background:
  it packs the sheet the way the client slices it, tells you up front whether
  the console will accept it, and writes the matching `theme.json` block. One
  download per platform, ffmpeg included.

Nothing in this repo's `themes.json` or `.zip` layout changes because of it —
the two databases are deliberately independent, so this one keeps working
whatever happens on the RomM side.

---

### Find me on Discord for requests

**[@Aramaki#2109](https://discord.gg/jhJ9jcUn)**

---

## 📥 Installing a theme — three ways

### 🎮 On your Switch, no PC needed

Grab **[Switch-Theme-Installer](https://github.com/A-Theme/Switch-Theme-Installer)** —
a native homebrew app that reads this repo's theme list directly. Browse
with a controller, preview a theme's real colors and layout before
committing, even regenerate its palette straight from its own background
image, right on the console. Pick a theme, press A, done.

### 💻 Manually

Download the `.zip` and extract it to `switch/tinfoil/themes` on your SD
card.

<div align="center">

[![Theme install example](https://github.com/Mung-Daddy/Tinfoil-Themes/assets/88863017/ee30cfd7-94ef-4b09-9695-3f166fe65441)](https://media.discordapp.net/attachments/1150177434147225662/1150177658777387109/2023070522381300_s.jpg?width=1787&height=1005)

</div>

### 📄 All at once with `index.tfl`

Download the `index.tfl` file to the root of your SD card and every theme
in this repo gets installed automatically.

<div align="center">

![index.tfl example](https://github.com/Mung-Daddy/Tinfoil-Themes/assets/88863017/7c2dc56c-1998-4e2c-9bb4-65a9a62b8152)

</div>

---

## 🎨 Want to customize a theme first?

Use the **[A-Theme visual editor](https://github.com/A-Theme/Theme-App)** —
browse this same theme list, tweak any color with a real picker, generate
a palette from scratch or straight from a background image, and export
your own version. Works in-browser, as an installable app, or as a
Windows desktop app. Whatever you build there reads from and can be
shared right back into this same database.

---

## 🔗 The whole A-Theme project

<div align="center">

[![Tinfoil-Themes](https://img.shields.io/badge/Tinfoil--Themes-theme%20database-ff3c50?style=for-the-badge)](https://github.com/A-Theme/Tinfoil-Themes)
[![Theme-App](https://img.shields.io/badge/Theme--App-visual%20editor-00c2ff?style=for-the-badge)](https://github.com/A-Theme/Theme-App)
[![Switch-Theme-Installer](https://img.shields.io/badge/Switch--Theme--Installer-on--console%20installer-9d4edd?style=for-the-badge)](https://github.com/A-Theme/Switch-Theme-Installer)

[![A-Theme](https://img.shields.io/badge/A--Theme-org-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/A-Theme)
[![Website](https://img.shields.io/badge/Web-a--theme.ca-e60012?style=for-the-badge&logo=googlechrome&logoColor=white)](https://a-theme.ca)

</div>

<div align="center">
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:00c2ff,50:9d4edd,100:ff3c50&height=100&section=footer" width="100%"/>
</div>
