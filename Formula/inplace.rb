class Inplace < Formula
  desc "Stream editor adaptor for in-place editing"
  homepage "https://github.com/nicowilliams/inplace"
  head "https://github.com/nicowilliams/inplace.git"

  def install
    bin.mkpath
    system ENV.cc, "inplace.c", "-o", bin/"inplace"
  end

  test do
    testfile = testpath/"test"
    testfile.write "hello"
    system bin/"inplace", testfile, "sed", "s/hell/cia/"
    assert_equal "ciao", testfile.read.chomp
  end
end
