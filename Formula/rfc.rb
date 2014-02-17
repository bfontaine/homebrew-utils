require 'formula'

class Rfc < Formula
  homepage 'https://github.com/bfontaine/rfc#readme'
  url 'https://github.com/bfontaine/rfc/archive/v0.1.1.tar.gz'
  sha1 '11b9e30f48a56a3462fde9152673b566ae90d2fa'

  def install
    bin.install 'rfc'
  end

  test do
    system "#{bin}/rfc", "--version"
  end
end
