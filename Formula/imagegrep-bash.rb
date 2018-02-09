class ImagegrepBash < Formula
  desc "Grep word in pdf or image based on OCR"
  homepage "https://github.com/coderofsalvation/imagegrep-bash"
  head "https://github.com/coderofsalvation/imagegrep-bash.git"

  depends_on "imagemagick"
  depends_on "tesseract"

  def install
    bin.install "imagegrep"
  end

  test do
    system bin/"imagegrep", test_fixtures("test.pdf"), "foo"
  end
end
