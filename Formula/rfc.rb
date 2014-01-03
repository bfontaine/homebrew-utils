require 'formula'

class Rfc < Formula
  homepage 'https://github.com/bfontaine/rfc#readme'
  url 'https://github.com/bfontaine/rfc/archive/v0.1.0.tar.gz'
  sha1 'ac22e6e438ab3fcc1fcd6ef144b3341d379568b9'

  def install
    bin.install 'rfc'
  end

  test do
    system "#{bin}/rfc", "--version"
  end
end
