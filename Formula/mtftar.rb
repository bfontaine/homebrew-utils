class Mtftar < Formula
  desc "Filter to translate MTF/BKF backup streams to the TAR format"
  homepage "https://github.com/geocar/mtftar"
  url "https://github.com/geocar/mtftar/archive/525e7e72fc6d05da448d14de29ada48eb5c8ccc1.tar.gz"
  version "2007-02-05.14-55"
  sha256 "8359cde73f82bceab69c78d1f01fd6ea4ae04ad42fa9f23850cac76ed5208f86"
  license "GPL-2.0"

  def install
    system "make"
    bin.install "mtftar"
  end

  test do
    system bin/"mtftar", "-h"
  end
end
