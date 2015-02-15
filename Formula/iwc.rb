class Iwc < Formula
  homepage "https://github.com/bfontaine/iwc"
  url "https://github.com/bfontaine/iwc/archive/0.0.1.tar.gz"
  sha1 "09b4e249d55cf2bd22dc0fb8d9033bd8eb994df8"
  head "https://github.com/bfontaine/iwc.git"

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match "2\n", pipe_output("#{bin}/iwc", "foo\nbar\n")
  end
end
