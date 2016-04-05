class Rfc < Formula
  homepage "https://github.com/bfontaine/rfc#readme"
  url "https://github.com/bfontaine/rfc/archive/v0.2.2.tar.gz"
  sha256 "fd6f3a820a0c16eb074110cf46c4df9c3b76ae6b4c6ed68dca1a59e5fd75dfaa"

  def install
    bin.install "rfc"
  end

  test do
    ENV["PAGER"] = "cat"
    assert_match "Message Data Types", shell_output("#{bin}/rfc 42")
  end
end
