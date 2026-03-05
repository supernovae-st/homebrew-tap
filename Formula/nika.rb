# Formula/nika.rb
# v0.21.0: Structured Output Engine (4-Layer Defense)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.21.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.21.0/nika-macos-arm64-0.21.0.tar.gz"
      sha256 "a2bb4e2c46b5c1b9c6e8f8bf92fa45947b67689aa43cd4c34c32d46d72de5373"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.21.0/nika-macos-x64-0.21.0.tar.gz"
      sha256 "9b4356e9915314eb9d7019cb26a460ca0cd836dae932fb1f2c9bf21eb531cac0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.21.0/nika-linux-arm64-0.21.0.tar.gz"
      sha256 "166efc72f68c2a9fc4d502ca29377330069f3491ffd467eb572c8a5c702a7582"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.21.0/nika-linux-x64-0.21.0.tar.gz"
      sha256 "24de0cdfe7721d8f81845c4d3ddff6712cb5aa7f7d0ad0b19d749b33aa78f69d"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
