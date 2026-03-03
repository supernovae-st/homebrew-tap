# Formula/nika.rb
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.19.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.19.1/nika-macos-arm64-0.19.1.tar.gz"
      sha256 "78473894c533f3419e940fa17cdbb50c109e0f51006e987e11c084ec908c01d6"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.19.1/nika-macos-x64-0.19.1.tar.gz"
      sha256 "d4691042c9ff333880a5dfac3500309bca14fefb7bd187cc98f7f92931ac3ef1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.19.1/nika-linux-arm64-0.19.1.tar.gz"
      sha256 "63f544da746523c182002ec76299034215d04a8fe769ca81ef81bbfe5588f2fd"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.19.1/nika-linux-x64-0.19.1.tar.gz"
      sha256 "2ef776ce34f573bd93d0a1939e138049679503c81189c59abec2999cb45f6333"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
