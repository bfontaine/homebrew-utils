require "formula"

class Up < Formula
  homepage 'https://github.com/bfontaine/up#readme'
  url "https://github.com/bfontaine/up/archive/0.1.2.tar.gz"
  sha1 "177a2c2b524785bc38509b2c601b586d7d1a1a51"

  def install
    bin.install 'bin/up'
  end

  test do
    system "#{bin}/up", "--version"
  end
end
