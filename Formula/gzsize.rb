class Gzsize < Formula
  desc "Print the uncompressed size of a GZip file"
  homepage "https://bfontaine.github.io/gzsize/"
  url "https://github.com/bfontaine/gzsize/archive/0.1.4.tar.gz"
  sha256 "0c2331e2a92131ba4dde4810a91fcc090771e18a2871b06df0d7b21d554d38d6"

  head "https://github.com/bfontaine/gzsize.git"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    s = "thisisatest" * 100
    testfile = testpath/"test"
    testfile.write s
    system "gzip", testfile
    assert_equal s.size.to_s,
      shell_output("#{bin}/gzsize #{testfile}.gz").chomp
  end
end
