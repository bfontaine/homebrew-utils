class Grape < Formula
  desc "Syntax-aware grep-like for Clojure"
  homepage "https://github.com/bfontaine/grape"
  version "0.4.0"

  if OS.mac?
    url "https://github.com/bfontaine/grape/releases/download/0.4.0/grape-0.4.0-macos-amd64.zip"
    sha256 "85c35cdc04a0eec2b72596f0dbe33e03a5139699af7319b58fe915c3dd121f28"
  else
    url "https://github.com/bfontaine/grape/releases/download/0.4.0/grape-0.4.0-linux-amd64.zip"
    sha256 "6fc6033e0abf2aced6737021bb3ffa7f69d6715a8bcdcf549b00325c9ab87c73"
  end

  bottle :unneeded

  def install
    bin.install "grape"
  end

  test do
    (testpath/"test.clj").write <<~EOS
    (ns my.test)

    (defn f
      [x]
      (* x 42))
    EOS
    assert_equal "(* x 42)",
      shell_output("#{bin}/grape '(* x $)' #{testpath}/test.clj").strip
  end
end
