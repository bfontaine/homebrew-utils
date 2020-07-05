require "language/node"

class Unravel < Formula
  desc "Command-line client for Clojure REPLs"
  homepage "https://github.com/pesterhazy/unravel"
  url "https://github.com/pesterhazy/unravel/archive/0.2.2.tar.gz"
  sha256 "144b2a96dc5900dada9e668f765ac63d55b97770525f1c994b8b41084048a9cc"

  head "https://github.com/pesterhazy/unravel.git"

  depends_on "node"
  depends_on "lumo" if OS.mac?

  def install
    if OS.mac?
      # This is installed by Homebrew
      lumo_version = build.stable? ? "1.6.0" : "1.7.0"
      inreplace "package.json",
        %Q("lumo-cljs": "#{lumo_version}",), ""
      inreplace "bin/unravel",
        '"${UNRAVEL_HOME}/node_modules/lumo-cljs/bin/lumo"', "lumo"
    end

    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    (bin/"unravel").write_env_script libexec/"bin/unravel",
      :UNRAVEL_HOME => libexec/"lib/node_modules/unravel-repl"
  end

  test do
    # We'd need a REPL to connect to in order to have a proper test
    system bin/"unravel", "--version"
  end
end
