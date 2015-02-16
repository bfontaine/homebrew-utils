class Iwc < Formula
  homepage "https://github.com/bfontaine/iwc"
  url "https://github.com/bfontaine/iwc/archive/0.1.1.tar.gz"
  sha1 "0b1c76ff033865f204114ef4f7919730f6062044"
  head "https://github.com/bfontaine/iwc.git"

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match "2\n", pipe_output("#{bin}/iwc", "foo\nbar\n")
  end
end
