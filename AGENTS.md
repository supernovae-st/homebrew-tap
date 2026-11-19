# AGENTS.md — homebrew-tap (Nika)

Vendor-neutral agent entry per the AGENTS.md convention (agents.md).

## What this repo is

The official **Homebrew tap** for [Nika](https://github.com/nika-open/nika)
— `brew install nika-open/tap/nika`. One formula (`Formula/nika.rb`).

## Load-bearing facts (verify in-repo · never from memory)

- The formula tracks the latest real Nika release tag — read it from
  `Formula/nika.rb` (`version "…"`), never from memory or this file (a
  hand-typed copy here drifted once: said 0.90.0 while the formula was on
  0.91.0). `main` in the engine may be on a later `-dev` version; never
  publish that through Homebrew until a matching release tag and assets exist.
- The language spec lives at `nika-open/nika-spec` (Apache-2.0) ·
  the engine at `nika-open/nika` (AGPL-3.0-or-later) · docs at
  `docs.nika.sh`.

## Editing rules

1. The formula tracks REAL tags on the engine repo — never a version that
   does not exist as a git tag.
2. Commit trailer: `Co-Authored-By: Nika 🦋 <nika@supernovae.studio>`.
