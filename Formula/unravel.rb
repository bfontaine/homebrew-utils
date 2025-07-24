require "language/node"

class Unravel < Formula
  desc "Command-line client for Clojure REPLs"
  homepage "https://github.com/pesterhazy/unravel"
  url "https://github.com/pesterhazy/unravel/archive/0.2.2.tar.gz"
  sha256 "144b2a96dc5900dada9e668f765ac63d55b97770525f1c994b8b41084048a9cc"

  head "https://github.com/pesterhazy/unravel.git"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_args(libexec)

    (bin/"unravel").write_env_script libexec/"bin/unravel",
      UNRAVEL_HOME: libexec/"lib/node_modules/unravel-repl"
  end

  test do
    # We'd need a REPL to connect to in order to have a proper test
    system bin/"unravel", "--version"
  end
end
