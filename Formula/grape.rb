class Grape < Formula
  desc "Syntax-aware grep-like for Clojure"
  homepage "https://github.com/bfontaine/grape"
  version "0.3.0"
  revision 1

  if OS.mac?
    url "https://github.com/bfontaine/grape/releases/download/0.3.0/grape-macos-amd64.zip"
    sha256 "77ee2f01b256512537ea1b45cf22c1227f404161bcf1f44f2615012a358ff372"
  else
    url "https://github.com/bfontaine/grape/releases/download/0.3.0/grape-linux-amd64.zip"
    sha256 "bdd49890b87a8619e486d7050bb5025459d7bc76c02959b2356cc9bae5271f6b"
  end

  bottle :unneeded

  def install
    bin.install Dir["grape-*"].first => "grape"
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
