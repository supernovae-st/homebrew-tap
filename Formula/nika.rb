# Formula/nika.rb — pre-built binaries, multi-arch (macOS + Linux)
# Bumped by CI on each release (release.yml → bump homebrew tap) · manual fallback:
# scripts/release/update-formula.sh (in the nika engine repo)
class Nika < Formula
  desc "Workflow language for AI - audit pipelines before they run, trace after"
  homepage "https://nika.sh"
  version "0.124.2"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "8f068e15364fa864d15fa985b7d1cd7f2fa03867c43bbc451802e75dbeec06e8"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "b88673408cb5232f6ac8110e3c853ea77adfa79cd71efc0b0b0ef3dbb9b0c2d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "2f6c2dce41cf1598f4db78216ed7bc68bc1922b5d5248601e3827780dcc7c32c"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "23d383b6190da3d70a4d2f973ead7fa1350638b8de15d89a5a5fbe6bfc30b94c"
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
