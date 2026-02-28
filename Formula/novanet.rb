# Formula/novanet.rb
class Novanet < Formula
  desc "Knowledge graph with MCP server for AI applications"
  homepage "https://github.com/supernovae-st/novanet"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/novanet/releases/download/v0.14.0/novanet-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_ARM64"
    end
    on_intel do
      url "https://github.com/supernovae-st/novanet/releases/download/v0.14.0/novanet-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/novanet/releases/download/v0.14.0/novanet-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/supernovae-st/novanet/releases/download/v0.14.0/novanet-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_X64"
    end
  end

  def install
    bin.install "novanet"
  end

  test do
    assert_match "novanet", shell_output("#{bin}/novanet --version")
  end
end
