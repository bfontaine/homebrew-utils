# typed: false
# frozen_string_literal: true

class TblsLinux < Formula
  desc "Linux version of the tbls formula (until upstream supports it)"
  homepage "https://github.com/k1LoW/tbls"
  url "https://github.com/k1LoW/tbls/releases/download/v1.56.0/tbls_v1.56.0_linux_amd64.tar.gz"
  version "1.56.0"
  sha256 "de952bb7f66461911e3aacd3e00bdfe4a3b499dcc048d3133852747c99b16baf"
  license "MIT"
  depends_on :linux

  def install
    system "./tbls", "completion", "bash", "--out", "tbls.bash"
    system "./tbls", "completion", "zsh", "--out", "tbls.zsh"
    bin.install "tbls"
    bash_completion.install "tbls.bash" => "tbls"
    zsh_completion.install "tbls.zsh" => "_tbls"
  end

  test do
    system bin/"tbls", "version"
  end
end
