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
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.8.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "1695722baaffb17b6a464977b1e08e12c4a048dbceeaf65eba06e2018e4513ad"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.5.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "1599c7b1ee2f267acc2adc3373dfd9ee2d0fac3ff7b0b44178e19cdb8432e54f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.5.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ef06bcb46d8ac591b1c6c16a8eb2a3dbcbd86789da2eecda78e53bb2cc35c4f"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.5.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2edb739f1faa6fe0f7ba497c55c78b68b62028339923ce591ef21eb09566422e"
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
