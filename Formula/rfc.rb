class Rfc < Formula
  desc "Bash tool to read RFCs from the command-line"
  homepage "https://github.com/bfontaine/rfc#readme"
  url "https://github.com/bfontaine/rfc/archive/v0.2.6.tar.gz"
  sha256 "724c47827ff1009359919a6fbdc9bb73d35c553546173f65058febca722f9931"

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
