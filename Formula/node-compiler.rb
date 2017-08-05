class NodeCompiler < Formula
  desc "Ahead-of-time (AOT) Compiler designed for Node.js."
  homepage "http://enclose.io"
  url "https://github.com/pmq20/node-compiler/archive/v1.1.0.tar.gz"
  sha256 "9c06048b206246c4dfe08bde875df1f5c87391a2b306389c0bc61640e1649706"

  depends_on "node"
  depends_on "squashfs"

  def install
    libexec.install %w[lib node bin]

    bin.write_exec_script libexec/"bin/nodec"
  end

  test do
    # Even a simple test would take minutes to complete
    system bin/"nodec", "--examples"
  end
end
