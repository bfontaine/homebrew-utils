class Eq < Formula
  desc "Command-line tool for edn processing and pretty printing"
  homepage "https://github.com/jonase/eq"
  head "https://github.com/jonase/eq.git"

  depends_on "ocaml"
  depends_on "opam" => :build

  def install
    opamroot = buildpath/"opamroot"
    ENV["OPAMROOT"] = opamroot
    ENV["OPAMYES"] = "1"
    system "opam", "init", "--no-setup"

    ENV.prepend_path "PATH", "#{opamroot}/system/bin"

    system "opam", "install", "ocamlfind", "ocamlbuild", "easy-format", "edn"

    system "opam", "config", "exec", "--",
      "ocamlbuild", "-use-ocamlfind", "-no-hygiene", "src/eq.native"

    bin.install "_build/src/eq.native" => "eq"
  end

  test do
    assert_equal "{}\n", pipe_output("#{bin}/eq", "{}", 0)
  end
end
