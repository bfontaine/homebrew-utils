require "language/go"

class Smuggler < Formula
  homepage "https://github.com/jbdalido/smg"
  url "https://github.com/jbdalido/smg.git",
    :revision => "d27f29b4290cf73b2ff1b2315bf611131189f7b0"
  version "0.5.1"

  head "https://github.com/jbdalido/smg.git"

  depends_on "go"

  def install
    mkdir_p "#{buildpath}/src/github.com/jbdalido/"
    ln_s buildpath, "#{buildpath}/src/github.com/jbdalido/smg"

    ENV["GOPATH"] = buildpath
    ENV.append_path "PATH", "#{ENV["GOPATH"]}/bin"

    system "go", "build", "-o", "smg"
    bin.install "smg"
  end

  test do
    system "#{bin}/smg", "-h"
  end
end
