class Mvb < Formula
  homepage "https://github.com/bfontaine/mvb#readme"
  url "https://github.com/bfontaine/mvb/archive/0.1.0.tar.gz"
  sha256 "cbc3e6de1f1bb422af472df7ecc9c918041a6bc5bd9fa3f0adc87229619e89e0"

  def install
    bin.install "mvb"
  end

  test do
    touch "bar"
    system "#{bin}/mvb", "foo", "bar"
    assert File.exist? "foo"
  end
end
