# first-minute.tape — the first proof right after `brew install`, in ~20
# seconds: `nika --version` names the release being recorded, then
# `nika try 01-hello` shows the first lesson, rehearses it on the mock model
# with no key and no network, and leaves the folder empty. The version comes
# first because the formula moves with each release and the README cannot
# name one. Every command is the released binary's own; the sandbox HOME
# (/tmp/you) is staged by scripts/media/render.sh, which writes the
# shell.zsh sourced below. The install itself is not recorded. House theme =
# the engine's nika-hero palette.
Output first-minute.gif

Set Shell zsh
Set FontFamily "JetBrains Mono"
Set FontSize 21
Set Width 1420
Set Height 940
Set Padding 24
Set Margin 22
Set MarginFill "#4f86ff"
Set BorderRadius 14
Set WindowBar Colorful
Set WindowBarSize 42
Set Theme { "name": "nika", "background": "#08090b", "foreground": "#dbe3ee", "cursor": "#4f86ff", "black": "#10131a", "red": "#ff6b6b", "green": "#34d399", "yellow": "#f0b45b", "blue": "#4f86ff", "magenta": "#b07bff", "cyan": "#22d3ee", "white": "#dbe3ee", "brightBlack": "#5b6472", "brightRed": "#ff8f8f", "brightGreen": "#5ee6b0", "brightYellow": "#ffd08a", "brightBlue": "#8db4ff", "brightMagenta": "#c9a2ff", "brightCyan": "#67e3f5", "brightWhite": "#ffffff" }
Set TypingSpeed 30ms
Set PlaybackSpeed 1.0

Hide
Type ". /tmp/you/shell.zsh && clear"
Enter
Show

Type "# just installed · which release is this?"
Enter
Sleep 500ms
Type "nika --version"
Enter
Sleep 1800ms
Type "# the first lesson, rehearsed offline with no key"
Enter
Sleep 600ms
Type "nika try 01-hello"
Enter
Sleep 7500ms

Type "clear"
Enter
Type "# the rehearsal wrote nothing in this folder"
Enter
Sleep 500ms
Type "ls -A"
Enter
Sleep 2400ms
Sleep 1200ms
