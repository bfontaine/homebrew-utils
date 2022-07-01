class Hiptext < Formula
  desc "Turn images into text better than caca/aalib"
  homepage "https://github.com/jart/hiptext"
  url "https://github.com/jart/hiptext/releases/download/0.2/hiptext-0.2.tar.gz"
  sha256 "7f2217dec8775b445be6745f7bd439c24ce99c4316a9faf657bee7b42bc72e8f"

  depends_on "pkg-config" => :build
  # hiptext doesn't build with ffmpeg 3.x
  # https://github.com/jart/hiptext/pull/27
  depends_on "ffmpeg@2.8"
  depends_on "freetype"
  depends_on "gflags"
  depends_on "glog"
  depends_on "jpeg"
  depends_on "libpng"

  def install
    # gflags doesn't supply .pc files
    # https://github.com/google/guetzli/issues/61
    ENV["LIBGFLAGS_CFLAGS"] = "-I#{Formula["gflags"].opt_include}"
    ENV["LIBGFLAGS_LIBS"] = "-L#{Formula["gflags"].opt_lib} -lgflags"

    # Fix the font path
    # https://github.com/jart/hiptext/issues/12
    inreplace "src/font.cc", "DejaVuSansMono.ttf",
                             "/System/Library/Fonts/Monaco.dfont"

    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"hiptext", test_fixtures("test.jpg")
  end
end
