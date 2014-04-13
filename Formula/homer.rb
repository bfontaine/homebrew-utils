require "formula"

class Homer < Formula
  homepage "https://github.com/bfontaine/homer"
  url "https://github.com/bfontaine/homer/archive/0.1.3.tar.gz"
  sha1 "74f61ec863d1305e4e808fa97000d74a14bd3843"

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
