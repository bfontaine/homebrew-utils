class RundeckCli < Formula
  desc "Command-line tool for Rundeck"
  homepage "https://rundeck.github.io/rundeck-cli/"
  url "https://github.com/rundeck/rundeck-cli/releases/download/v1.0.22/rd-1.0.22.zip"
  sha256 "933b3f8d0fcda00d8745f4a7ed6589903a0a53f90a8e36ff97fcdfd2bb96e09c"

  depends_on :java

  def install
    rm Dir["bin/*.bat"]
    libexec.install Dir["*"]

    bin.install_symlink libexec/"bin/rd"
  end

  test do
    assert_match(/^Run a Job/, shell_output("#{bin}/rd run help", 2))
  end
end
