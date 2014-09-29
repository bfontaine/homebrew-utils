require "formula"

class Up < Formula
  homepage 'https://github.com/bfontaine/up#readme'
  url "https://github.com/bfontaine/up/archive/0.1.4.tar.gz"
  sha1 "eb6d6a2a54f18929ef9877f8e1c7252ae6cc7cc5"

  def install
    bin.install 'bin/up'
    bash_completion.install "utils/up.bash"
  end

  test do
    ENV['COMMANDS'] = pwd+'/foo'
    touch 'foo'
    system "#{bin}/up", "--add", "x", "touch y"
    system "#{bin}/up", "x"
    system "#{bin}/up", "--rm", "x"
  end
end
