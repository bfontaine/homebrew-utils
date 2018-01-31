class NodePacker < Formula
  desc "Ahead-of-time (AOT) Compiler designed for Node.js"
  homepage "http://enclose.io"
  url "https://github.com/pmq20/node-packer/archive/v1.5.0.tar.gz"
  sha256 "0bb94148ca130c2bd252caac46ab56cf32a82165746c16cd68411a75b669b378"

  depends_on "node"
  depends_on "squashfs"

  def install
    libexec.install %w[lib node bin]
    bin.write_exec_script libexec/"bin/nodec"
  end

  test do
    # Even a simple test would take minutes to complete
    system bin/"nodec", "--version"
  end
end
