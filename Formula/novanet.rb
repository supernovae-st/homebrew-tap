# Formula/novanet.rb
#
# INTERNAL USE ONLY
# This formula builds from a private repository (supernovae-st/novanet).
# External users cannot install this formula - it requires SSH access to the repo.
#
# For SuperNovae team members:
#   1. Ensure you have SSH access to github.com:supernovae-st/novanet.git
#   2. brew install supernovae-st/tap/novanet
#
class Novanet < Formula
  desc "Knowledge graph CLI + TUI with MCP server for AI applications"
  homepage "https://github.com/supernovae-st/novanet"
  version "0.16.2"
  license "LicenseRef-Proprietary"

  # Build from source - private repository (requires SSH access)
  url "https://github.com/supernovae-st/novanet.git",
      tag:      "v0.16.2",
      revision: "c8816caa1dcca3a03264c6e49c2dee8cd0728a88"

  depends_on "rust" => :build

  def install
    cd "tools/novanet" do
      system "cargo", "install", *std_cargo_args
    end
  end

  def caveats
    <<~EOS
      INTERNAL USE ONLY - This formula requires access to a private repository.

      NovaNet requires Neo4j database for full functionality.

      To start Neo4j:
        brew services start neo4j

      Or use Docker:
        docker run -d --name neo4j -p 7474:7474 -p 7687:7687 neo4j

      Configuration:
        novanet init    # Interactive setup wizard
    EOS
  end

  test do
    assert_match "novanet", shell_output("#{bin}/novanet --version")
  end
end
