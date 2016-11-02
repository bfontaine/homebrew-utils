class Gzsize < Formula
  desc "Print the uncompressed size of a GZip file"
  homepage "https://bfontaine.github.io/gzsize/"
  url "https://github.com/bfontaine/gzsize/archive/0.1.1.tar.gz"
  sha256 "ffb9cc1e5ed10443b1bcf2f711787bc7f69eee27ed83b48f2ccf9d80e39554dd"

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
