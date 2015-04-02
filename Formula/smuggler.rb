require "language/go"

class Smuggler < Formula
  homepage "https://github.com/jbdalido/smg"
  url "https://github.com/jbdalido/smg.git",
    :revision => "0b51d16e74374d603c5f10d48433bb63b7859d88"
  version "0.1.0"

  head "https://github.com/jbdalido/smg.git"

  depends_on "go"

  def install
    mkdir_p "#{buildpath}/src/github.com/jbdalido/"
    ln_s buildpath, "#{buildpath}/src/github.com/jbdalido/smg"

    ENV["GOPATH"] = buildpath
    ENV.append_path "PATH", "#{ENV["GOPATH"]}/bin"

    system "make", "osx"
    bin.install Dir["bin/*"]
  end

  test do
    system "#{bin}/smg", "-h"
  end
end
