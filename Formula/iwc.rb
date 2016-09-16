class Iwc < Formula
  homepage "https://github.com/bfontaine/iwc"
  url "https://github.com/bfontaine/iwc/archive/0.1.3.tar.gz"
  sha256 "2b17506c44caec574682bec4f56ec08d3cdd3c36f00f9489bdb192ad378ca81e"
  head "https://github.com/bfontaine/iwc.git"

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match "2\n", pipe_output("#{bin}/iwc", "foo\nbar\n")
  end
end
