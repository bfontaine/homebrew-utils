class Babashka < Formula
  desc "Native, fast starting Clojure interpreter for scripting"
  homepage "https://babashka.org"
  url "https://github.com/babashka/babashka/releases/download/v0.6.0/babashka-0.6.0-macos-amd64.tar.gz"
  sha256 "acb767ad8e693e875fccbd5206103e4541ddd67ea371c3164f5e562b9231ee50"
  version "0.6.0"
  license "EPL-1.0"

  def install
    bin.install "bb"
  end

  test do
    assert_equal "{:a \"foo\"}\n",
      pipe_output("echo '{:a \"foo\"}' | #{bin}/bb -I -O -e '*input*'")
  end
end
