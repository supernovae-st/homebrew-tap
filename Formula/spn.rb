# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.2.0"
  license "MIT"

  # Dependencies - installing spn installs these too
  depends_on "supernovae-st/tap/nika"
  depends_on "supernovae-st/tap/novanet"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.2.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "5a36967cde6e48205f95194dcf00b6c29a70e5244ea007aa00537f9baef718a3"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.1.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "846021173171a84494556b12c62a8104537905d98bc34c183ce2fcff2f1fa151"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.1.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8896c60f3bfcc1a37bb58ba2e65310e38717b2a7151b1032843f33acbaf66036"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.1.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "863a9423e20c83677cca4e81a6faff6633fe1fc57afdfeabef91f19d604fc32c"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    # Test spn itself
    assert_match "spn", shell_output("#{bin}/spn --version")

    # Test that dependencies are available
    assert_match "nika", shell_output("nika --version")
    assert_match "novanet", shell_output("novanet --version")
  end
end
