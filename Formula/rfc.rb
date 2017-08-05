class Rfc < Formula
  desc "Bash tool to read RFCs from the command-line"
  homepage "https://github.com/bfontaine/rfc#readme"
  url "https://github.com/bfontaine/rfc/archive/v0.2.3.tar.gz"
  sha256 "03b51b1045c61d6b2ebd563d47f3f3c36c7a4f37d5c4b7d29b0c8aa073e8e2d3"

  def install
    bin.install "rfc"
  end

  test do
    ENV["PAGER"] = "cat"
    assert_match "Message Data Types", shell_output("#{bin}/rfc 42")
  end
end
