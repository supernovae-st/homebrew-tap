# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.14.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.0/spn-aarch64-apple-darwin.tar.gz"
      sha256 "6b466125a8b29bea45834774df648da3be9c1494e676c562c2a5e454db247b6f"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "aa0b4ed3ded67973ad70259bd3ca2e1659be4bc755d912397df4de26f2ef8a0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a55c98c43a77527ec5d40189dc17a0828ebe403865d9287ee3daef9c137b214a"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdd9295b6b1ee21cf788bbec959dccaf1c40c5fbda2a16ad020cc54160bb2bd4"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
