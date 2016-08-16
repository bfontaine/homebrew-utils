class Gzsize < Formula
  desc "Print the uncompressed size of a GZip file"
  homepage "https://bfontaine.github.io/gzsize/"
  url "https://github.com/bfontaine/gzsize/archive/0.1.0.tar.gz"
  sha256 "df64a4374e65a5e8cd288bb399e4599a5c99248a8c8317fe2c844db595b94765"

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
