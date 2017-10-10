class Sgrep < Formula
  desc "Sorted grep"
  homepage "https://sgrep.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/sgrep/sgrep/sgrep-1.0/sgrep-1.0.tgz"
  sha256 "dc5edc5eb667077f18c04d6c1d89bf08818a986fb5734414f8f937639ddad13e"

  def install
    system "make"
    bin.install "sgrep"
  end

  test do
    testfile = testpath/"test"
    testfile.write "1\n2\n3\n4\n"

    assert_equal("2\n", shell_output("#{bin}/sgrep 2 #{testfile}"))
  end
end
