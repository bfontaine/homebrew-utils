class Mvb < Formula
  homepage "https://github.com/bfontaine/mvb#readme"
  url "https://github.com/bfontaine/mvb/archive/0.1.0.tar.gz"
  sha1 "dab1579349141a5df08749a64f7011299d1a08ad"

  def install
    bin.install "mvb"
  end

  test do
    touch "bar"
    system "#{bin}/mvb", "foo", "bar"
    assert File.exist? "foo"
  end
end
