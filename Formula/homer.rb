require "formula"

class Homer < Formula
  homepage "https://github.com/bfontaine/homer"
  url "https://github.com/bfontaine/homer/archive/0.1.1.tar.gz"
  sha1 "ad60fbb12834b30705088ab9fdafe74673175740"

  def install
    ENV['PREFIX'] = prefix
    system "make", "install"
  end

  test do
    system "#{bin}/homer -O mylog touch a_file"
    system "[ -f mylog ]"
    system "[ -f a_file ]"
  end
end
