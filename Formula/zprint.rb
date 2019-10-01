class Zprint < Formula
  desc "Library to reformat Clojure(Script) source code and s-expressions"
  homepage "https://github.com/kkinnear/zprint"
  if OS.linux?
    url "https://github.com/kkinnear/zprint/releases/download/0.4.16/zprintl-0.4.16",
      :using => :nounzip
    sha256 "dd050df8932a252b6223a60295d462a732772067bb8aab1e57202c8082830f5e"
  else
    url "https://github.com/kkinnear/zprint/releases/download/0.4.16/zprintm-0.4.16",
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
