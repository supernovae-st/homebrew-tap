# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.14.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.1/spn-aarch64-apple-darwin.tar.gz"
      sha256 "b65ff25ccf3b65947a07c78021e6447d0fc3a0ab3dd45a71215a098571bffa2a"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.1/spn-x86_64-apple-darwin.tar.gz"
      sha256 "2332222604f0d7b652ba81daa529aa4b1bd0092cacb655c2b4cee4f75598deb8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.1/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ccf1aa57e707074e2369c03f1d80f85b5addeaeca7d604a789fb2e295b843d0a"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.14.1/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b36a726f8b6802305a04ea01f2c4e021d12a2b17b6826c19a56b936cf0aecf63"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
