class Reredirect < Formula
  desc "Tool to dynamically redirect outputs of a running process"
  homepage "https://github.com/jerome-pouiller/reredirect"
  url "https://github.com/jerome-pouiller/reredirect/archive/refs/tags/v0.3.tar.gz"
  sha256 "ec01398ee442ff1223bcad608811b8cae2d116a1e519e2dc40fe48a4a6220e91"
  license "MIT"

  depends_on :linux

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"reredirect", "-h"
  end
end
