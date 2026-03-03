# Formula/nika.rb
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.17.5"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.17.5/nika-macos-arm64-0.17.5.tar.gz"
      sha256 "99bc3ebad81c853e8f28797c0930aed17ec915669db6a7ba71983eabf80bb687"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.17.5/nika-macos-x64-0.17.5.tar.gz"
      sha256 "85580d73b43b7425ab99e8481a614accba6e61600145afa4c85269a25912cec1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.17.5/nika-linux-arm64-0.17.5.tar.gz"
      sha256 "e6ed03c4413d561963ebc4a975383b450f28ec1d331fe7c37e05bf384439f255"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.17.5/nika-linux-x64-0.17.5.tar.gz"
      sha256 "9c97a8a6cb7d620b33e8c2a0abaaba4c3e414fc949fdd8fca58efe02adee21be"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
