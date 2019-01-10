# Retrieved from https://raw.githubusercontent.com/Homebrew/homebrew-head-only/35a27139b0878857031693b4f8b975279872a56c/vdfuse.rb
# The formula used to be provided by the (now-removed) head-only Homebrew tap.
# It was later migrated to the (now-removed) boneyard tap.
# The version above is the last one before it was removed.

class VirtualBoxInstalled < Requirement
  fatal true

  def self.app_path
    [
      "/Applications/VirtualBox.app",
      "#{ENV["HOME"]}/Applications/VirtualBox.app",
      ENV["VIRTUALBOX_APP"],
    ].find { |dir| dir && File.exist?("#{dir}/Contents/MacOS/VBoxDD.dylib") }
  end

  satisfy :build_env => false do
    self.class.app_path
  end

  def message; <<~EOS
    vdfuse requires VirtualBox to be installed
    If you installed to a non-standard location, set the VIRTUALBOX_APP environment variable.
    EOS
  end
end

class Vdfuse < Formula
  desc "Fuse driver to mount VirtualBox compatible disk images"
  homepage "https://github.com/SophosLabs/vdfuse"
  head "https://github.com/SophosLabs/vdfuse.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "subversion" => :build

  depends_on :osxfuse
  depends_on VirtualBoxInstalled

  def install
    configure_opts = [
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}",
    ]

    osxfuse = Formula["osxfuse"]
    configure_opts << "--with-fuse-headers=#{osxfuse.include}/osxfuse" if osxfuse.installed?

    inreplace "configure.ac", /VBOX_INSTALL_DIR=.*/, "VBOX_INSTALL_DIR=\"#{VirtualBoxInstalled.app_path}/Contents/MacOS\""

    system "./fetch_vbox_headers.sh"
    system "./autogen.sh"
    system "./configure", *configure_opts
    system "make", "install"
  end
end
