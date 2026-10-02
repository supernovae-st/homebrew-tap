# Formula/nika.rb — pre-built binaries, multi-arch (macOS + Linux)
# Bumped by CI on each release (release.yml → bump homebrew tap) · manual fallback:
# scripts/release/update-formula.sh (in the nika engine repo)
class Nika < Formula
  desc "Workflow language for AI - audit pipelines before they run, trace after"
  homepage "https://nika.sh"
  version "0.122.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "3e7de00024732de9616261ecd8b51686f1f48a86ae5e51614e1415649462c540"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "92effa1c26520455160d9f8437a0431e194ab71187e0e564babc918f588c9f28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "1806373345c53ffad40c7f9a5fa995a6d7d81dd488fbcd508e493561c0b7edec"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "d9b6b84f7acedd0c6a1ed1830b4f6866106f634e72ac7cec61134382e56334f7"
    end
  end

  def install
    bin.install "nika"
    generate_completions_from_executable(bin/"nika", "completions")
  end

  def caveats
    <<~EOS
      First 60 seconds:
        nika welcome                                    # what this machine has - where to start
        nika try 01-hello                               # offline proof - zero keys - nothing written
        nika init                                       # wire THIS repo (editor schema - AGENTS.md - Cursor rule)

      Fully local, no API key (install ollama first):
        ollama pull qwen3.5:4b
        nika try 01-hello --model ollama/qwen3.5:4b

      Editors and agents:
        nika wire cursor|claude|vscode                  # explicit MCP wiring (idempotent)
        nika compile hello my-first.nika               # write an offline workflow - then: nika check

      Agent plugin kit (skills - subagents - /nika:* commands - hooks - MCP, one bundle):
        claude plugin marketplace add supernovae-st/nika-plugins && claude plugin install nika@nika
        codex plugin marketplace add supernovae-st/nika-plugins && codex plugin add nika@nika
        nika doctor                                     # is the suite coherent? (binary - kits - keys)

      Learn: https://nika.sh - docs: https://docs.nika.sh
    EOS
  end

  test do
    # The binary self-reports its version.
    assert_match version.to_s, shell_output("#{bin}/nika --version")

    # A minimal nine-key workflow must pass static checking (the `check` ladder).
    # Identity is `nika: <kebab-id>` (nine keys).
    (testpath/"brew-smoke.nika").write <<~YAML
      nika: brew-smoke
      permits:
        exec: ["echo"]
      tasks:
        hello:
          exec: { command: ["echo", "hello"] }
    YAML
    assert_match "PLAN", shell_output("#{bin}/nika check #{testpath}/brew-smoke.nika")

    # The authoring command taught in caveats must produce a checkable program.
    system bin/"nika", "compile", "hello", testpath/"my-first.nika"
    assert_path_exists testpath/"my-first.nika"
    assert_match "PLAN", shell_output("#{bin}/nika check #{testpath}/my-first.nika")

    # The engine must also EXECUTE, not just statically check — an install that
    # can `check` but not `run` passes the line above yet is broken for users.
    # A one-task infer under the mock provider is hermetic (no network, no key,
    # no permits) and proves the run path end to end.
    (testpath/"brew-run-smoke.nika").write <<~YAML
      nika: brew-run-smoke
      tasks:
        greet:
          infer: { prompt: "say hello" }
    YAML
    assert_match "1/1 done",
      shell_output("#{bin}/nika run #{testpath}/brew-run-smoke.nika --model mock/echo")
  end
end
