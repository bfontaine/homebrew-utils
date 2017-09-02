class Gcstar < Formula
  desc "Collections-management application"
  homepage "http://www.gcstar.org/index.en.php"
  url "https://web.archive.org/web/20170314122315/http://download.gna.org/gcstar/gcstar-1.7.1.tar.gz"
  sha256 "da2c90071a61bf42f4c6e9f6ddee6eb9b60b8f9af711c435cd24d44735429f3d"

  depends_on "pkg-config" => :build
  depends_on "gobject-introspection"
  depends_on "pango"
  depends_on "gtk+"

  resource "perl-extutils-depends" do
    url "http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/ExtUtils-Depends-0.405.tar.gz"
    sha256 "8ad6401ad7559b03ceda1fe4b191c95f417bdec7c542a984761a4656715a8a2c"
  end

  resource "perl-extutils-pkgconfig" do
    url "http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/ExtUtils-PkgConfig-1.16.tar.gz"
    sha256 "bbeaced995d7d8d10cfc51a3a5a66da41ceb2bc04fedcab50e10e6300e801c6e"
  end

  resource "perl-glib" do
    url "http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Glib-1.326.tar.gz"
    sha256 "020d0308220cb6e03a086bd45d33dd8fe03b265c502bfc2b4e58f2dbe64c365f"
  end

  resource "perl-cairo" do
    url "http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Cairo-1.106.tar.gz"
    sha256 "e64803018bc7cba49e73e258547f5378cc4249797beafec524852140f49c45c4"
  end

  resource "perl-pango" do
    url "http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Pango-1.227.tar.gz"
    sha256 "34b0a422df3fecd7597587048552457d48ae764c43bbefd2a9d62ceb6c8bac71"
  end

  resource "perl-gtk2" do
    url "http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Gtk2-1.24992.tar.gz"
    sha256 "a2ed6902f7f29f7c8dddbe58119589f433252a12132c295c54afbac587cc8480"
  end

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"

    resources.each do |r|
      r.stage do
        system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
        system "make"
        system "make", "install"
      end
    end

    system "./install", "--prefix=#{libexec}"
    share.install libexec/"man"
    (bin/"gcstar").write_env_script(libexec/"bin/gcstar",
                                    :PERL5LIB => ENV["PERL5LIB"])
  end

  test do
    system bin/"gcstar", "-x"
  end
end
