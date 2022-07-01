class Zprint < Formula
  desc "Library to reformat Clojure(Script) source code and s-expressions"
  homepage "https://github.com/kkinnear/zprint"

  on_macos do
    url "https://github.com/kkinnear/zprint/releases/download/1.2.3/zprintm-1.2.3",
      using: :nounzip
    sha256 "ec60356f74c81df39899bbceec285b3eb1cecde68a7f403e0df3ef8db9ed43f6"
  end

  on_linux do
    url "https://github.com/kkinnear/zprint/releases/download/1.2.3/zprintl-1.2.3",
      using: :nounzip
    sha256 "78c475b90a0cd1780a3953149559c5fad42cf29c1900fbaf39088d7cde763a34"
  end

  def install
    suffix = OS.linux? ? "l" : "m"
    bin.install "zprint#{suffix}-#{version}" => "zprint"
  end

  test do
    assert_equal "{:a 1}", pipe_output(bin/"zprint", "{ :a  1, }", 0).chomp
  end
end
