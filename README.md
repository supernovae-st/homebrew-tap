# Homebrew Tap for SuperNovae

Official Homebrew tap for SuperNovae tools.

## Installation

```bash
# Add the tap
brew tap supernovae-st/tap

# Install tools
brew install nika      # Workflow engine only
brew install novanet   # Knowledge graph only
brew install spn       # Full suite (includes nika + novanet)
```

## Available Formulas

| Formula | Description |
|---------|-------------|
| `nika` | Semantic YAML workflow engine for AI |
| `novanet` | Knowledge graph with MCP server |
| `spn` | SuperNovae CLI - package manager (installs nika + novanet) |

## Updating

```bash
brew update
brew upgrade nika novanet spn
```

## From Source

All tools are written in Rust. To build from source:

```bash
git clone https://github.com/supernovae-st/nika
cd nika && cargo build --release
```

## Links

- [Nika](https://github.com/supernovae-st/nika)
- [NovaNet](https://github.com/supernovae-st/novanet)
- [SuperNovae CLI](https://github.com/supernovae-st/supernovae-cli)
