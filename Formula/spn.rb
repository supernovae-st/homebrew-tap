# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.8.0"
  license "MIT"

  # Required dependency
  depends_on "supernovae-st/tap/nika"

  # NovaNet is optional - spn works without it but `spn nv` commands won't work
  # To install: brew install supernovae-st/tap/novanet (requires building from source)

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.8.0/spn-aarch64-apple-darwin.tar.gz"
      sha256 "ddbfac5de605631923e351bef69a9ec492379ebda893fb529d9fff81140181b6"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.8.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "1695722baaffb17b6a464977b1e08e12c4a048dbceeaf65eba06e2018e4513ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.8.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6da790f8d34438b30ea646e17aa20cdac215eee9411bc42cea3773b6e655c2e"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.8.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f3c76931a7e8894e48c33f8f9444e124e8a92526f7a6da4860c5b089203df30"
    end
  end

  def install
    bin.install "spn"
  end

  def caveats
    <<~EOS
      NovaNet CLI is optional but recommended for full functionality.
      Without it, `spn nv` commands will not work.

      To install NovaNet (requires Rust):
        cargo install --git https://github.com/supernovae-st/novanet.git
    EOS
  end

  test do
    # Test spn itself
    assert_match "spn", shell_output("#{bin}/spn --version")

    # Test that nika is available
    assert_match "nika", shell_output("nika --version")
  end
end
