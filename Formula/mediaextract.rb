class Mediaextract < Formula
  desc "Extracts media files embedded within other files"
  homepage "https://panzi.github.io/mediaextract/"
  url "https://github.com/panzi/mediaextract/archive/v1.0.tar.gz"
  sha256 "56b0198ddd8f24e1d1b664120928133b495e407166022e8f39de7e917bc78787"
  head "https://github.com/panzi/mediaextract.git"

  def install
    system "make", "builddir"
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/mediaextract", "-s", "#{bin}/mediaextract"
  end
end
