# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.14.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.2/spn-aarch64-apple-darwin.tar.gz"
      sha256 "05a49c428d976ca1d816cfb962626bcf59f216ab181bb8fad7d68fba1ee7c19d"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.2/spn-x86_64-apple-darwin.tar.gz"
      sha256 "ca0809d36c9e31561216ebce572150ff57e8d6078bfdaea80cb191ba96bb19df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.2/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5985d09944aecc8f5aac5bb86efa44e8852e5131a1b2c40fca513e11ac71fc91"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.2/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab67b56c403c102454be4667d8b623bef7b0647f32d842a284ac594888f517de"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
