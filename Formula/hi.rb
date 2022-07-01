class Hi < Formula
  desc "Host info for your shell"
  homepage "https://github.com/nikopol/hi"
  url "https://raw.githubusercontent.com/nikopol/hi/e875673b9bfc64459d4c5b4b746b9e8e7fc9ba3e/hi",
    nounzip: true
  version "0.7"
  sha256 "10dc0e30a3d751732f5e29412d20e93658093a0a63376b607c7e4ccd419e0b7d"

  def install
    bin.install "hi"
  end

  test do
    system bin/"hi"
  end
end
