class Imapbackup < Formula
  desc "IMAP Backup Tool"
  homepage "http://tamale.net/imapbackup/"
  # unfortunately no tag for now
  url "https://github.com/rcarmo/imapbackup/archive/5762b005e6fc87d78593052dcfbf08a5853dfe4a.zip"
  version "1.4g"
  sha256 "5f4cccf2a9076fefe496dca6409ca2f85b5a7bf59faaad4be930809a1625231d"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    bin.install "imapbackup.py" => "imapbackup"
  end

  test do
    assert_match "Usage:",
      shell_output("#{bin}/imapbackup", 2)
  end
end
