class Iwc < Formula
  homepage "https://github.com/bfontaine/iwc"
  url "https://github.com/bfontaine/iwc/archive/0.1.1.tar.gz"
  sha256 "75730584ae0ba54e7a6d73d8ce353a9b0ea359aecebc4d094b698c4935a86ea9"
  head "https://github.com/bfontaine/iwc.git"

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match "2\n", pipe_output("#{bin}/iwc", "foo\nbar\n")
  end
end
