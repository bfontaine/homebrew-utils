require "formula"

class Up < Formula
  homepage 'https://github.com/bfontaine/up#readme'
  url "https://github.com/bfontaine/up/archive/0.1.1.tar.gz"
  sha1 "e21549402ca74b00dc0dec5ef0d5e0b9de098587"

  def install
    bin.install 'bin/up'
  end

  test do
    system "#{bin}/up", "--version"
  end
end
