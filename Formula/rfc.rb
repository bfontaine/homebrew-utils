class Rfc < Formula
  desc "Bash tool to read RFCs from the command-line"
  homepage "https://github.com/bfontaine/rfc#readme"
  url "https://github.com/bfontaine/rfc/archive/v0.2.4.tar.gz"
  sha256 "b707e3ea15b9478b802b2e1d140ce45b2fa537334134b52a3dfad5e809150464"

  def install
    bin.install "rfc"
  end

  test do
    ENV["PAGER"] = "cat"
    assert_match "Message Data Types", shell_output("#{bin}/rfc 42")
  end
end
