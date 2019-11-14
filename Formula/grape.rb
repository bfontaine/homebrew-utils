class Grape < Formula
  desc "Syntax-aware grep-like for Clojure"
  homepage "https://github.com/bfontaine/grape"
  url "https://github.com/bfontaine/grape/releases/download/0.2.0/grape-0.2.0-standalone.jar"
  sha256 "8245d12c00e92c5bd05e5a39aa92b9cc7881ec26c05abf1466aeb0270f5a0a30"

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
