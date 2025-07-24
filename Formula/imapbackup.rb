class Imapbackup < Formula
  desc "IMAP Backup Tool"
  homepage "http://tamale.net/imapbackup/"
  # no tag, unfortunately
  url "https://github.com/rcarmo/imapbackup/archive/5762b005e6fc87d78593052dcfbf08a5853dfe4a.tar.gz"
  version "1.4g"
  sha256 "b543a08e14050df7d7261f143e6740bb1a978e4c3dd56608cabc50ec167cf492"

  def install
    bin.install "imapbackup.py" => "imapbackup"
  end

  test do
    assert_match "Usage:",
      shell_output("#{bin}/imapbackup", 2)
  end
end
