class Rfc < Formula
  desc "Bash tool to read RFCs from the command-line"
  homepage "https://github.com/bfontaine/rfc#readme"
  url "https://github.com/bfontaine/rfc/archive/refs/tags/v2.0.0/v2.0.0.tar.gz"
  sha256 "34f0559d2362661af36642a76d3c8a197cfe273581be9ec1a2327849219884d3"

  head "https://github.com/bfontaine/rfc.git"

  def install
    bin.install "rfc"
    man1.install "man/rfc.1"
    bash_completion.install "rfc.bash"
  end

  test do
    ENV["PAGER"] = "cat"
    assert_match "Message Data Types", shell_output("#{bin}/rfc 42")
  end
end
