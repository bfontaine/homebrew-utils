class Grape < Formula
  desc "Syntax-aware grep-like for Clojure"
  homepage "https://github.com/bfontaine/grape"
  # This is necessary until upstream (aka me) provide binaries for Linux
  if OS.linux?
    url "https://github.com/bfontaine/grape/releases/download/0.3.0/grape-0.3.0-standalone.jar"
    sha256 "aee05320694ce955fc111a3d257061c3ce2bb5e37180d5e469ac23ca7f44435d"
  else
    url "https://github.com/bfontaine/grape/releases/download/0.3.0/grape-macos-amd64.zip"
    sha256 "77ee2f01b256512537ea1b45cf22c1227f404161bcf1f44f2615012a358ff372"
  end

  bottle :unneeded

  depends_on :java

  def install
    if OS.linux?
      jar = "grape-#{version}-standalone.jar"
      libexec.install jar
      bin.write_jar_script libexec/jar, "grape"
    else
      bin.install "grape-macos-amd64" => "grape"
    end
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
