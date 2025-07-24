class Qxw < Formula
  desc "Program to help you create and publish crosswords"
  homepage "https://www.quinapalus.com/qxw.html"
  url "https://www.quinapalus.com/qxw-20200708.tar.gz"
  sha256 "ed6c6effb815789ec3f7214738c905570e58030e5b8e5b493fec8c70148d23ea"
  license "GPL-2.0-only"

  depends_on "pcre" => :build
  depends_on "pkg-config" => :build
  # TODO: figure out those that are build-only
  depends_on "cairo"
  depends_on "glib"
  depends_on "gtk+"

  def install
    if OS.mac?
      dpkg_buildflags = (buildpath/"fake-dpkg-buildflags")
      dpkg_buildflags.write "#!/bin/sh\n"
      dpkg_buildflags.chmod 0744

      inreplace "Makefile" do |s|
        # Linux-only ld flags
        s.gsub!("-Bsymbolic-functions", "")
        s.gsub!(",-z,", ",")
        s.gsub!("-Wl,relro", "-Wl")

        s.gsub!("dpkg-buildflags", "./fake-dpkg-buildflags")
      end
    end

    system "make"

    # The 'install' target installs everything under $(DESTDIR)/usr/{games,include,share}
    # so it’s better to do it ourselves
    # system "make", "install", "DESTDIR=#{prefix}"
    bin.install "qxw"
    include.install "qxwplugin.h"

    (share/"applications").install "qxw.desktop"
    (share/"pixmaps").install "qxw.xpm"
    %w[48 64 96 128 256].each do |n|
      (share/"icons/hicolor/#{n}x#{n}/apps").install "icon-#{n}x#{n}.png" => "qxw.png"
    end
  end

  test do
    (testpath/"test.qxd").write "ab\nde\nad\nbe"
    system bin/"qxw", "-b", (testpath/"test.qxd")
  end
end
