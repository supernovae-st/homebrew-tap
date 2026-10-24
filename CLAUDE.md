# homebrew-tap

**Homebrew Tap** for [Nika](https://github.com/supernovae-st/nika).

## Installation

```bash
brew install supernovae-st/tap/nika
```

## Formulas

| Formula | Description |
|---------|-------------|
| `nika` | Workflow language for AI — audit before run, trace after |

## Structure

```
homebrew-tap/
├── Formula/
│   └── nika.rb       # Workflow engine
├── README.md
└── CLAUDE.md
```

## Updating the Formula

The formula tracks the latest real Nika release tag and is bumped from the
engine release workflow when assets and checksums are published. Do not bump to
a dev workspace version or to a tag that does not exist.

When a new Nika version is released:

1. Verify release assets exist: `gh release view vX.Y.Z --repo supernovae-st/nika --json assets`
2. Update the `version` field in `Formula/nika.rb`
3. Update each `sha256` from the release's `SHA256SUMS` (one file for the four archives)
4. Test locally: `brew install --build-from-source Formula/nika.rb`

The release tarball naming convention is:

```
nika-{macos|linux}-{arm64|x64}-{version}.tar.gz
```

## Related Repos

| Repo | Description |
|------|-------------|
| [nika](https://github.com/supernovae-st/nika) | Nika source code |

## Conventions

- Follow [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- Multi-platform support via `on_macos` / `on_linux` blocks
- Include SHA256 checksums for every download
- Only bump the formula when release assets are confirmed published
