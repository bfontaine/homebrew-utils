class Hi < Formula
  desc "Host info for your shell"
  homepage "https://github.com/nikopol/hi"
  url "https://raw.githubusercontent.com/nikopol/hi/142ae3026aab757f4f33dbc30023e9868ab41046/hi",
    :nounzip => true
  version "0.4"
  sha256 "11f71440653880c8f1eb2ebfd95232823558264f4285f6d1c461ac3544c2c49d"

  def install
    bin.install "hi"
  end

  test do
    system bin/"hi"
  end
end
