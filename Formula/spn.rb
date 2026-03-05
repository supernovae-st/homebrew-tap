# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.12.0"
  license "MIT"

  # Required dependency
  depends_on "supernovae-st/tap/nika"

  # NovaNet is optional - spn works without it but `spn nv` commands won't work
  # To install: brew install supernovae-st/tap/novanet (requires building from source)

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "23b41a4e699618666e1117980cded89a6c62a4acd63ae86bd9a19ab18432ddf5"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.10.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "ab986c509e36e34ac3b0d43ff932adea246153d785bfc97b7ddb2a4ab4b4b3b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.10.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "64fee77d25dbfbf3c4ea31f395879b9bf4ccdbb132b3be03de52f8ac821e4cb4"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.10.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "60177126bf9820d15862e88935655e9c0171e7cb2b30ad26009dbfe80ad5d276"
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
