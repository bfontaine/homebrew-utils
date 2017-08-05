class Homer < Formula
  desc "Command-line tool to daemonize a task."
  homepage "https://github.com/bfontaine/homer"
  url "https://github.com/bfontaine/homer/archive/0.1.3.tar.gz"
  sha256 "a76936289178ce4d8806aebba1add986d49c2f86c04c78f682134d9deb1d3de4"

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/homer", "-O", "mylog", "touch", "a_file"
    assert File.exist? "mylog"
    assert File.exist? "a_file"
  end
end
