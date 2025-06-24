class Zprint < Formula
  desc "Library to reformat Clojure(Script) source code and s-expressions"
  homepage "https://github.com/kkinnear/zprint"

  on_macos do
    url "https://github.com/kkinnear/zprint/releases/download/1.3.0/zprintm-1.3.0",
      using: :nounzip
    sha256 "9e1301b25a84126e556eda16f2f4bf626c1a2032e7ab33902b1b30bccd963417"
  end

  on_linux do
    url "https://github.com/kkinnear/zprint/releases/download/1.3.0/zprintl-1.3.0",
      using: :nounzip
    sha256 "3447ad2fe18847d884a1555e8384763c461b55b8959063a7454d68e76fe2071e"
  end

  def install
    suffix = OS.linux? ? "l" : "m"
    bin.install "zprint#{suffix}-#{version}" => "zprint"
  end

  test do
    assert_equal "{:a 1}", pipe_output(bin/"zprint", "{ :a  1, }", 0).chomp
  end
end
