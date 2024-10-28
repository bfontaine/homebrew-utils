class Rfc < Formula
  desc "Bash tool to read RFCs from the command-line"
  homepage "https://github.com/bfontaine/rfc#readme"
  url "https://github.com/bfontaine/rfc/archive/refs/tags/v1.0.1/v1.0.1.tar.gz"
  sha256 "65ed320e57d1bc746dc9fc98af307d8789e72fe85cf58f0cc4cc3e8b54a84843"

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
