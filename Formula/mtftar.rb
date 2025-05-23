class Mtftar < Formula
  desc "Filter to translate MTF/BKF backup streams to the TAR format"
  homepage "https://github.com/geocar/mtftar"
  url "https://github.com/geocar/mtftar/archive/525e7e72fc6d05da448d14de29ada48eb5c8ccc1.zip"
  version "2007-02-05.14-55"
  sha256 "7010c7e61d1f1c0f8d3f531b59255b1b0dacb76f75984df60a6712e4c0471479"
  license "GPL-2.0"

  def install
    system "make"
    bin.install "mtftar"
  end

  test do
    system bin/"mtftar", "-h"
  end
end
