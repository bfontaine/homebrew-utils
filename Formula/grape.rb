class Grape < Formula
  desc "Syntax-aware grep-like for Clojure"
  homepage "https://github.com/bfontaine/grape"
  version "0.5.0"

  if OS.mac?
    url "https://github.com/bfontaine/grape/releases/download/0.5.0/grape-macos-amd64.zip"
    sha256 "fc869e1bd32bbf4c39c032657eaf4495da201a8882c705c87cfdd28367770a3c"
  else
    url "https://github.com/bfontaine/grape/releases/download/0.5.0/grape-linux-amd64.zip"
    sha256 "9b3fcb2dcc8b48278e3ce7252c5dc8858adc824a977989aba2cf16aa44efef62"
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
    assert_equal "5:  (* x 42)",
      shell_output("#{bin}/grape '(* x $)' #{testpath}/test.clj").strip
  end
end
