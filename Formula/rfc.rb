class Rfc < Formula
  homepage "https://github.com/bfontaine/rfc#readme"
  url "https://github.com/bfontaine/rfc/archive/v0.2.2.tar.gz"
  sha1 "07aa0a5c3c0b02b30e671ef63b56babd5165c8f3"

  def install
    bin.install "rfc"
  end

  test do
    ENV["PAGER"] = "cat"
    assert_match "Message Data Types", shell_output("#{bin}/rfc 42")
  end
end
