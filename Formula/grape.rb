class Grape < Formula
  desc "Syntax-aware grep-like for Clojure"
  homepage "https://github.com/bfontaine/grape"
  version "0.5.1"

  if OS.mac?
    url "https://github.com/bfontaine/grape/releases/download/0.5.1/grape-macos-amd64.zip"
    sha256 "0d1de29ccc7368382b742bfcc2b447f1d8634bc5570199e2d759a03a2c143211"
  else
    url "https://github.com/bfontaine/grape/releases/download/0.5.1/grape-linux-amd64.zip"
    sha256 "7a38582e05a09043d82599b36a29fedc22ab7f14e2ed63f50576933abc431fa4"
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
      shell_output("#{bin}/grape --no-line-numbers '(* x $)' #{testpath}/test.clj").strip
  end
end
