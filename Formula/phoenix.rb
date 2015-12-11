class Phoenix < Formula
  desc "Small command-line image forensics tool"
  homepage "https://github.com/ebemunk/phoenix"
  url "https://github.com/ebemunk/phoenix/archive/1.1.tar.gz"
  sha256 "fd313b2caf7f97cc5018129e7dba72ab6e2d27bd886fddbdcf55532277edd20f"

  depends_on "homebrew/science/opencv"
  depends_on "pkg-config" => :build
  depends_on "boost"

  # Fix the build on OS X
  patch do
    url "https://github.com/ebemunk/phoenix/commit/bff0eb5c0e40f19a96049cf35249863ec9164aec.patch"
    sha256 "4d9b41790cb2d141e9153c68eb6409a4164bc7b15c4ae426b2b10a4353d65d45"
  end

  def install
    # don't build for windows
    inreplace "Makefile", "WIN = 1", ""

    bin.mkpath
    system "make", "OCV_INC=#{Formula["homebrew/science/opencv"].include}",
                   "BOOST_INC=#{Formula["boost"].include}",
                   "BIN_DIR=#{bin}"
  end

  test do
    system "#{bin}/phoenix", "--ela", "-j", "-f", test_fixtures("test.jpg")
  end
end
