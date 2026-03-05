# Formula/novanet.rb
# v0.16.2: Knowledge Graph CLI + TUI + MCP Server
class Novanet < Formula
  desc "Knowledge graph CLI + TUI with MCP server for AI applications"
  homepage "https://github.com/supernovae-st/novanet"
  version "0.16.2"
  license "LicenseRef-Proprietary"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/novanet/releases/download/v0.16.2/novanet-macos-arm64-0.16.2.tar.gz"
      sha256 "e9ba9578f75dec75cf4454bc53d2009b078b4f536e1627fd2042ff7231f6fced"
    end
    on_intel do
      # TODO: Add x64 binary when CI releases are set up
      odie "NovaNet is not yet available for Intel Macs. Please use Apple Silicon."
    end
  end

  on_linux do
    # TODO: Add Linux binaries when CI releases are set up
    odie "NovaNet is not yet available for Linux. Coming soon."
  end

  def install
    bin.install "novanet"
  end

  def caveats
    <<~EOS
      NovaNet requires Neo4j database for full functionality.

      Quick setup:
        novanet init    # Interactive setup wizard

      Start Neo4j:
        brew services start neo4j

      Or use Docker:
        docker run -d --name neo4j -p 7474:7474 -p 7687:7687 neo4j

      Documentation:
        https://github.com/supernovae-st/novanet
    EOS
  end

  test do
    assert_match "novanet", shell_output("#{bin}/novanet --version")
  end
end
