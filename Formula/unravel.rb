require "language/node"

class Unravel < Formula
  desc "Command-line client for Clojure REPLs"
  homepage "https://github.com/pesterhazy/unravel"

  # Unfortunately we don't have stable releases for now.
  # https://github.com/pesterhazy/unravel/issues/10
  head "https://github.com/pesterhazy/unravel.git"

  depends_on "node"
  depends_on "lumo" if OS.mac?

  def install
    if OS.mac?
      # This is installed by Homebrew
      inreplace "package.json",
        '"lumo-cljs": "1.2.0",', ""
      inreplace "bin/unravel",
        '"${UNRAVEL_HOME}/node_modules/lumo-cljs/bin/lumo"', "lumo"
    else
      inreplace "package.json",
        '"lumo-cljs": "1.2.0",', '"lumo-cljs": "1.6.0",'
    end

    # For some reason it doesn't find its resource
    inreplace "src/unravel/loop.cljs",
      '"resources/unrepl/blob.clj"',
      %Q("#{libexec}/lib/node_modules/unravel-repl/resources/unrepl/blob.clj")

    system "npm", "install", *Language::Node.std_npm_install_args(libexec)

    (bin/"unravel").write_env_script libexec/"bin/unravel",
      :UNRAVEL_HOME => libexec/"lib/node_modules/unravel-repl"
  end

  test do
    # We'd need a REPL to connect to in order to have a proper test
    system bin/"unravel", "--version"
  end
end
