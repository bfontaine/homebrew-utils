class Grape < Formula
  desc "Syntax-aware grep-like for Clojure"
  homepage "https://github.com/bfontaine/grape"
  url "https://github.com/bfontaine/grape/releases/download/0.1.0/grape-0.1.0-standalone.jar"
  sha256 "47419e97f8f4a43af9117892bd4f73c1111a58896c9659242eb3f7a0731b97c1"

  bottle :unneeded

  depends_on :java

  def install
    jar = "grape-#{version}-standalone.jar"
    libexec.install jar
    bin.write_jar_script libexec/jar, "grape"
  end

  test do
    (testpath/"test.clj").write <<~EOS
    (ns my.test)

    (defn f
      [x]
      (* x 42))
    EOS
    assert_equal "(* x 42)",
      shell_output("#{bin}/grape '(* x $)' #{testpath}/test.clj").chomp
  end
end
