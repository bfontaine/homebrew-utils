require 'formula'

class Rfc < Formula
  homepage 'https://github.com/bfontaine/rfc#readme'
  url 'https://github.com/bfontaine/rfc/archive/v0.2.0.tar.gz'
  sha1 'dde3b1ba9f8468d41b5959abd94ab134bfe7f50a'

  def install
    bin.install 'rfc'
  end

  test do
    system "#{bin}/rfc", "--version"
  end
end
