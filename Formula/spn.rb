# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.4.0"
  license "MIT"

  # Required dependency
  depends_on "supernovae-st/tap/nika"

  # NovaNet is optional - spn works without it but `spn nv` commands won't work
  # To install: brew install supernovae-st/tap/novanet (requires building from source)

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.4.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "886063810db90dd6abd6f59aacf7d0f6c3cc540774a5aa5bb8f975be11e5ea7e"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.3.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "7bf2eb179c3efb92a28d7c9e222a3314171a19f17617f67a93810b716b84dea8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.3.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e51d5a0d14c4e0a31c75873fba92cd68df323282ef27530dedcb759c5c7ca5e"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.3.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a7812a032ed5a68a4d5dd439fb5b232662ab1073ef260f9194ee5903a8cf5b93"
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
