require 'formula'

class Rfc < Formula
  homepage 'https://github.com/bfontaine/rfc#readme'
  url 'https://github.com/bfontaine/rfc/archive/v0.2.1.tar.gz'
  sha1 'f710b563ea7da35ed0825c6b42d2d568f2c47d38'

  def install
    bin.install 'rfc'
  end

  test do
    system "#{bin}/rfc", "--version"
  end
end
