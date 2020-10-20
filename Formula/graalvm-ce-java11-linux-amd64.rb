class GraalvmCeJava11LinuxAmd64 < Formula
  desc "GraalVM CE binary for Linux built by the GraalVM community"
  homepage "https://www.graalvm.org/"
  url "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.2.0/graalvm-ce-java11-linux-amd64-20.2.0.tar.gz"
  sha256 "5db74b5b8888712d2ac3cd7ae2a8361c2aa801bc94c801f5839351aba5064e29"
  license "GPLv2"

  # conflicts_with "openjdk", because: "both install the same binaries"
  # conflicts_with "openjdk@11", because: "both install the same binaries"
  # conflicts_with "adoptopenjdk", because: "both install the same binaries"
  # conflicts_with "adoptopenjdk@11", because: "both install the same binaries"

  # keg_only rather than conflicts_with so we can still install it but it's not symlinked
  keg_only "it installs the same binaries as openjdk & similar formulae"

  def install
    prefix.install Dir["*"]
  end

  test do
    system bin/"java", "-version"
  end
end
