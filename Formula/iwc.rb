class Iwc < Formula
  homepage "https://github.com/bfontaine/iwc"
  url "https://github.com/bfontaine/iwc/archive/0.1.0.tar.gz"
  sha1 "847d2525494d0d4d40ff77ba0f1aff6d4ef85ae0"
  head "https://github.com/bfontaine/iwc.git"

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match "2\n", pipe_output("#{bin}/iwc", "foo\nbar\n")
  end
end
