<p align="center">
  <a href="https://nika.sh">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://nika.sh/brand/nika-logo-dark.svg">
      <img src="https://nika.sh/brand/nika-logo-light.svg" alt="Nika" width="220">
    </picture>
  </a>
</p>

<h1 align="center">supernovae-st/tap/nika</h1>

<p align="center">
  <strong>The Homebrew door to Nika: one command installs the released engine, checksummed for your platform, with its shell completions.</strong><br>
  macOS and Linux, arm64 and x64. The formula follows the engine's release train.
</p>

<p align="center">
  <a href="Formula/nika.rb"><img src="https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsupernovae-st%2Fhomebrew-tap%2Fmain%2FFormula%2Fnika.rb&amp;search=version%20%22(%5B0-9.%5D%2B)%22&amp;replace=%241&amp;label=formula" alt="Formula pin"></a>
  <a href="https://github.com/supernovae-st/homebrew-tap/actions/workflows/test.yml"><img src="https://github.com/supernovae-st/homebrew-tap/actions/workflows/test.yml/badge.svg?branch=main" alt="Tap gate status"></a>
  <a href="https://github.com/supernovae-st/nika/releases/latest"><img src="https://img.shields.io/github/v/release/supernovae-st/nika?label=engine" alt="Engine release"></a>
  <a href="https://docs.nika.sh"><img src="https://img.shields.io/badge/docs-docs.nika.sh-8b8cf8.svg" alt="Documentation"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT"></a>
</p>

<p align="center">
  <a href="https://scorecard.dev/viewer/?uri=github.com/supernovae-st/homebrew-tap"><img src="https://api.scorecard.dev/projects/github.com/supernovae-st/homebrew-tap/badge" alt="OpenSSF Scorecard"></a>
  <a href="https://archive.softwareheritage.org/browse/origin/?origin_url=https://github.com/supernovae-st/homebrew-tap"><img src="https://archive.softwareheritage.org/badge/origin/https://github.com/supernovae-st/homebrew-tap/" alt="Archived by Software Heritage"></a>
</p>

## Thirty seconds, no API key

```sh
brew install supernovae-st/tap/nika
nika --version
```

```
nika <version> (<commit>)
```

The version is the one [`Formula/nika.rb`](Formula/nika.rb) pins and the
commit is the engine build it was cut from. This README never repeats the
number: the tap's CI refuses any version literal here, so the pin has exactly
one home.

Write `hello.nika`. The `mock/echo` model rehearses with no key and no
network:

```yaml
nika: hello
model: mock/echo
permits: {}
tasks:
  greeting:
    infer:
      prompt: "Say hello from Homebrew."
      max_tokens: 32
outputs:
  greeting: ${{ tasks.greeting.output }}
```

Audit it before anything runs:

```sh
nika check hello.nika
```

```
 ✔ ORDER    no exec: sits downstream of a net-effecting task · unauthored content never reaches a shell
 ✔ PERMITS  literal + const: args fit the boundary · computed paths + symlinks are the RUN's verdict
 ✔ TRIFECTA no lethal trifecta over the declared permits: without a human gate
 ✔ JOURNEY internal · 0 sources · 0 destinations · 1 model endpoint · no secret reaches an external destination
 ✔ audited · 1 task · 1 wave · permits {} · est out ≤$0.0000 · 0 hints · risk low
 layers · valid ✔ · access ready ✔ · capacity fit ✔ · run ready ✔
```

Run it under a zero ceiling:

```sh
nika run hello.nika --quiet --max-cost-usd 0
```

```
  ✔  hello · 1 task · 0.0s · unpriced (1 call)
```

The run left a hash-chained, sealed trace under `.nika/traces/`;
`nika trace verify <trace>` reads the chain back and reports whether it is
intact and whether the run's signature verifies.

<p align="center">
  <img src="https://raw.githubusercontent.com/supernovae-st/nika/main/media/nika-hero.gif" alt="nika check audits the workflow (plan, cost, secrets, types), then nika run executes it locally" width="820">
</p>

*The engine's own recording (`media/nika-hero.gif` on its `main` branch).*

## Why this door

- **Audited before it runs.** `nika check` renders the engine's verdict on the
  order of effects, the permits, the lethal trifecta, the journey of every
  secret and the cost floor. A red check never becomes a run.
- **Sovereign by default.** The same file runs on local models (Ollama,
  llama.cpp, vLLM), on Mistral, Hugging Face, OpenAI, xAI, Anthropic and the
  rest of the engine's catalog; `mock/echo` rehearses with no key and no
  network. The formula's caveats name the fully local route first.
- **Traced after.** Every run leaves a hash-chained journal and a receipt;
  `nika trace verify` checks them. Nothing about the proof is reimplemented
  in Homebrew.
- **Checksummed, bot-bumped, installed for real.** Each platform tarball is
  pinned by its sha256 in the formula; the formula is bumped by the engine's
  release workflow once a release's assets and checksums exist; the tap's
  own CI installs the formula from the pull request's checkout and runs its
  test block on every pull request and every push to `main`.

## What the formula installs

- **One binary**, `nika`, taken from the engine's own release asset
  `nika-{macos|linux}-{arm64|x64}-<version>.tar.gz` and verified against the
  sha256 the formula pins for that platform. The tarballs are prebuilt, so
  nothing compiles on your machine, and there are no Homebrew bottles to
  trust separately: the formula points straight at the release.
- **Shell completions** for bash, zsh and fish, generated at install time
  from `nika completions <shell>` and linked where each shell looks under
  the Homebrew prefix: `etc/bash_completion.d/nika`,
  `share/zsh/site-functions/_nika`,
  `share/fish/vendor_completions.d/nika.fish`.
- **Nothing else.** No man page, no post-install hook, no editor or agent
  configuration. Wiring an editor or an agent to the MCP oracle is an
  explicit act: `nika wire detected --dry-run` previews what this machine
  shows and writes nothing, `nika wire detected` wires it.

After the install Homebrew prints the formula's caveats: the first commands
(`nika welcome`, `nika try 01-hello`, `nika init`), the fully local route
through Ollama and Qwen, the editor and agent wiring, and `nika doctor`.

## Your first minute

```sh
nika welcome         # the mirror: what this machine has, where to start (offline, always exit 0)
nika try 01-hello    # the embedded example, rehearsed on mock/echo: nothing written
nika doctor          # diagnose-only: prints the exact fix, never mutates anything
nika init            # wire THIS repo: editor schema, AGENTS.md, agent files (existing files are skipped)
```

<p align="center">
  <img src="media/first-minute.gif" alt="nika welcome mirrors the machine (editors, local providers, keys, workspace), then nika try 01-hello rehearses the first workflow offline on the mock provider, zero keys, nothing written" width="820">
</p>

*Recorded by `scripts/media/render.sh` against the released binary of its
day, in a sandboxed home; every line on screen is the binary's own output.*

The caveats' fully local route, no API key, once Ollama is installed:

```sh
ollama pull qwen3.5:4b
nika try 01-hello --model ollama/qwen3.5:4b
```

## Verify what you installed

```sh
brew test supernovae-st/tap/nika
```

This runs the formula's own test block against the installed keg:
`nika --version` must carry the pinned version, a nine-key workflow must pass
`nika check`, `nika compile hello` must write a checkable program, and a
one-task workflow must run to `1/1 done` on `mock/echo`.
An install that can check but not run fails here. The same block runs in
this tap's CI on every pull request, after a real install from the pull
request's checkout.

## The tap's own gate

[`test.yml`](.github/workflows/test.yml) runs on every push to `main` and
every pull request, on macOS:

1. the README carries no version literal (the pin lives in the formula only);
2. `brew style` on the formula;
3. a tap from the checkout and a real `brew install`;
4. `brew audit --except version` on the installed formula;
5. `brew test`, the block above;
6. a smoke of the installed binary: `nika --version`, completions for the
   three shells, `nika spec --canon`, `nika try 01-hello`.

Every action is SHA-pinned and no user-controlled string reaches a shell;
Dependabot moves the pins in one grouped weekly pull request.
[`scorecard.yml`](.github/workflows/scorecard.yml) measures the repository's
supply-chain posture weekly and on every push to `main`, and publishes it to
the OpenSSF Scorecard badge above.

## Update, uninstall

```sh
brew update && brew upgrade nika
brew uninstall nika && brew untap supernovae-st/tap
```

`nika doctor` diagnoses the machine (binary, config, provider keys, local
models), prints the exact fix and never mutates anything. The
[engine README](https://github.com/supernovae-st/nika#readme) lists the
other doors: its install script and the npm package `@supernovae-st/nika`
([nika-client](https://github.com/supernovae-st/nika-client)).

## Security

This tap is supply-chain critical: a compromised formula would ship to every
`brew install`. The formula pins release artifacts by URL and sha256, tracks
real engine release tags only, and is bumped by the engine's release
workflow. Report a checksum mismatch, a URL hijack risk or an unexpected
install step to **security@supernovae.studio**, never through a public
issue: [SECURITY.md](SECURITY.md) has the process and the response times.

<!-- city:map -->
## The city · where this repo sits

```text
📜 nika-spec ──── language law and conformance
    │
    ▼
⚙️ nika ───────── engine, admission, execution, receipts and schedules
    │  release assets: prebuilt tarballs for macOS and Linux, arm64 and x64
    ▼
🍺 homebrew-tap ── this dock: one formula pins each release by sha256
    │
    ▼
💻 your machine ── brew install supernovae-st/tap/nika
```

This repository ships the engine's release artifacts through Homebrew. It is
not authoritative for the workflow language or the engine: the formula
follows the release train, and only the caveats are authored here.

All the buildings: [nika-spec](https://github.com/supernovae-st/nika-spec) ·
[nika](https://github.com/supernovae-st/nika) ·
[nika.sh](https://nika.sh) ·
[nika-docs](https://github.com/supernovae-st/nika-docs) ·
[nika-client](https://github.com/supernovae-st/nika-client) ·
[nika-vscode](https://github.com/supernovae-st/nika-vscode) ·
[nika-plugins](https://github.com/supernovae-st/nika-plugins) ·
[gh-nika](https://github.com/supernovae-st/gh-nika) ·
[homebrew-tap](https://github.com/supernovae-st/homebrew-tap) ·
[nika-action](https://github.com/supernovae-st/nika-action) ·
[nika-actions-starter](https://github.com/supernovae-st/nika-actions-starter) ·
[nika-registry](https://github.com/supernovae-st/nika-registry) ·
[nika-estate](https://github.com/supernovae-st/nika-estate).
<!-- /city:map -->

## License

Formula files in this repository: [MIT](LICENSE). Nika itself:
AGPL-3.0-or-later, the license the formula declares for what it installs.

<p align="center">
  <sub>Docs: <a href="https://docs.nika.sh">docs.nika.sh</a> · Security: <a href="SECURITY.md">SECURITY.md</a> · Engine: <a href="https://github.com/supernovae-st/nika">nika</a> · Issues: <a href="https://github.com/supernovae-st/nika/issues">engine tracker</a></sub>
</p>
