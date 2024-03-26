class Rfc < Formula
  desc "Bash tool to read RFCs from the command-line"
  homepage "https://github.com/bfontaine/rfc#readme"
  url "https://github.com/bfontaine/rfc/archive/v1.0.0.tar.gz"
  sha256 "ceb3e968a8f4c1caf35b15196a4151faa3632f9c5bae277d89de77d352b93172"

  head "https://github.com/bfontaine/rfc.git"

  def install
    bin.install "rfc"
    man1.install "man/rfc.1"
  end

  test do
    ENV["PAGER"] = "cat"
    assert_match "Message Data Types", shell_output("#{bin}/rfc 42")
  end
end
