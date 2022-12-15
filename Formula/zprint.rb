class Zprint < Formula
  desc "Library to reformat Clojure(Script) source code and s-expressions"
  homepage "https://github.com/kkinnear/zprint"

  on_macos do
    url "https://github.com/kkinnear/zprint/releases/download/1.2.4/zprintm-1.2.4",
      using: :nounzip
    sha256 "ce8cf67d64827ec83c784e1f9fa2077aa084de1792738763372150ee33304022"
  end

  on_linux do
    url "https://github.com/kkinnear/zprint/releases/download/1.2.4/zprintl-1.2.4",
      using: :nounzip
    sha256 "835b79c425ca1f80cfdb3ec6b361c0fd9c95a2a395a02765273ca786008e43ea"
  end

  def install
    suffix = OS.linux? ? "l" : "m"
    bin.install "zprint#{suffix}-#{version}" => "zprint"
  end

  test do
    assert_equal "{:a 1}", pipe_output(bin/"zprint", "{ :a  1, }", 0).chomp
  end
end
