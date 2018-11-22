class Zprint < Formula
  desc "Library to reformat Clojure(Script) source code and s-expressions"
  homepage "https://github.com/kkinnear/zprint"
  if OS.linux?
    url "https://github.com/kkinnear/zprint/releases/download/0.4.13/zprintl-0.4.13",
      :using => :nounzip
    sha256 "6477333c9e3abb978632cd3212840fdc769e2233a4743ea2adddbb17c86d11ef"
  else
    url "https://github.com/kkinnear/zprint/releases/download/0.4.13/zprintm-0.4.13",
      :using => :nounzip
  end

  def install
    suffix = OS.linux? ? "l" : "m"
    bin.install "zprint#{suffix}-#{version}" => "zprint"
  end

  test do
    assert_equal "{:a 1}", pipe_output(bin/"zprint", "{ :a  1, }", 0).chomp
  end
end
