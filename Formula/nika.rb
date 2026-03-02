# Formula/nika.rb
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.16.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.1/nika-macos-arm64-0.16.1.tar.gz"
      sha256 "4eb1a99471e174f1f61389b4c98388b3c71113fcaf86e85519740a42e762a48f"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.1/nika-macos-x64-0.16.1.tar.gz"
      sha256 "7a8ff8d94da3d81c156930721cbd80e280b9a0e9a612948648c2bca547db0d86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.1/nika-linux-arm64-0.16.1.tar.gz"
      sha256 "7d21b94ee5d66c61ec26b04f601340bdcf2cdc1a7589f8e543eb506caee1fd80"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.1/nika-linux-x64-0.16.1.tar.gz"
      sha256 "4d7469efb02aeb288f8a42828a1faf673dde5825b017387670f2c6cf5d953a43"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
