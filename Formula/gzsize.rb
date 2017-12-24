class Gzsize < Formula
  desc "Print the uncompressed size of a GZip file"
  homepage "https://bfontaine.github.io/gzsize/"
  url "https://github.com/bfontaine/gzsize/archive/0.1.2.tar.gz"
  sha256 "32e20cb2e570f16bc30e62c4fda406ede23b23dfd313fc82528173827487b170"

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
