# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.12.4"
  license "MIT"

  # Required dependency
  depends_on "supernovae-st/tap/nika"

  # NovaNet is optional - spn works without it but `spn nv` commands won't work
  # To install: brew install supernovae-st/tap/novanet (requires building from source)

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.4/spn-x86_64-apple-darwin.tar.gz"
      sha256 "3472d55b53eb3fb8d9c1b14653c31540d74b6501b461d437e926e9eb95af8013"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "23b41a4e699618666e1117980cded89a6c62a4acd63ae86bd9a19ab18432ddf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4df7d567e4e4057dcb9422fdc5660e02d031b33df6ed54b56151b9e621a13cb"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49251adb1927a6711305a4024e71158a3888c3c137b72d01cfbd489e9feb805a"
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
