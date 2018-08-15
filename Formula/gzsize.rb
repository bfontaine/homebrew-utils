class Gzsize < Formula
  desc "Print the uncompressed size of a GZip file"
  homepage "https://bfontaine.github.io/gzsize/"
  url "https://github.com/bfontaine/gzsize/archive/0.1.3.tar.gz"
  sha256 "1d021710b3ff43bfe3ee115beb477953f756a4f967be3f03a7c5f8023f10a77d"

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
