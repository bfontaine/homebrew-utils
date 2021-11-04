class Grape < Formula
  desc "Syntax-aware grep-like for Clojure"
  homepage "https://github.com/bfontaine/grape"
  version "0.6.0"

  if OS.mac?
    url "https://github.com/bfontaine/grape/releases/download/0.6.0/grape-macos-amd64.zip"
    sha256 "b625f5e2bd55e28ddeb1f0c92f0a2251e948dac1a7403e4aa93dd29da51ac10b"
  else
    url "https://github.com/bfontaine/grape/releases/download/0.6.0/grape-linux-amd64.zip"
    sha256 "92c5a64596d78c09ca4abaf0c60c0df4610aab7538109f4f71717d3975ec70b1"
  end

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
