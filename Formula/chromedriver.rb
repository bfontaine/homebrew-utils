class Chromedriver < Formula
  desc "Web driver for Chrome"
  homepage "https://sites.google.com/a/chromium.org/chromedriver/home"
  url "https://chromedriver.storage.googleapis.com/2.44/chromedriver_mac64.zip"
  version "2.44"
  sha256 "3fd49c2782a5f93cb48ff2dee021004d9a7fb393798e4c4807b391cedcd30ed9"
  depends_on :macos

  def install
    bin.install "chromedriver"
  end

  test do
    system bin/"chromedriver", "--version"
  end
end
