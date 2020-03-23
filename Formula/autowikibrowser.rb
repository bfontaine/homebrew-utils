class Autowikibrowser < Formula
  desc "Semi-automated Wikipedia editor"
  homepage "https://en.wikipedia.org/wiki/Wikipedia:AutoWikiBrowser"
  url "https://downloads.sourceforge.net/project/autowikibrowser/autowikibrowser/AutoWikiBrowser6101/AutoWikiBrowser6101.zip"
  sha256 "0c0d037d0b18bf1d7d1cde156d9122872bfcf39ea733122be1f007ea59e72386"

  def install
    libexec.install Dir["*"]
  end

  def caveats
    <<~EOS
      AutoWikiBrowser needs Wine to work on macOS.

      See: https://en.wikipedia.org/wiki/Wikipedia:AutoWikiBrowser/Mono_and_Wine#Wine_on_a_Mac_using_homebrew

      The .exe has been installed under:

        #{exe_path}
    EOS
  end

  def exe_path
    "#{opt_libexec}/AutoWikiBrowser.exe"
  end

  test do
    assert File.file?(exe_path)
  end
end
