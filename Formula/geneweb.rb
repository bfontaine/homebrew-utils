class Geneweb < Formula
  desc "Open-source genealogy software with a web interface"
  homepage "https://geneweb.org"
  license "GPL-2.0"
  version "7.0.0"

  on_macos do
    url "https://github.com/geneweb/geneweb/releases/download/v7.0.0/geneweb-macos-10.15-88536ed4.zip"
    sha256 "8af4e62bce0ff721619ebf2aa84cb6b7838b6018e73f7f5f6f87c650bb55c38c"
  end

  on_linux do
    url "https://github.com/geneweb/geneweb/releases/download/v7.0.0/geneweb-linux-88536ed4.zip"
    sha256 "5f531f7d4702346d8fbbd4b6f889bbac31be6ac5a6f4e33474de46e97c0e4b62"
  end

  def install
    libexec.install Dir["*"]

    # the directory is empty in the build directory
    (libexec/"bases").rmdir
    bases_dir = etc/"geneweb/bases"
    bases_dir.mkpath

    libexec.install_symlink bases_dir

    binaries = OS.linux? ? %w[gwd gwsetup] : %w[geneweb.command gwd.command gwsetup.command]

    if OS.linux?
      # these scripts assume bases/ and gw/ are in the same directory
      # use an absolute path instead.
      binaries.each do |cmd|
        inreplace libexec/cmd, "../gw", "#{libexec}/gw"
      end
    end

    binaries.each do |cmd|
      bin.write_exec_script libexec/cmd
    end
  end
end
