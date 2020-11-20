class Glue < Formula
  include Language::Python::Virtualenv

  desc "Simple command-line tool to generate CSS sprites"
  homepage "https://glue.readthedocs.io"
  url "https://github.com/jorgebastida/glue/archive/0.13.tar.gz"
  sha256 "dc95244425b0732f88d8083221c5bab6187dd2382351c8f1eab5139a229d69df"
  license "BSD-3-Clause"

  depends_on "freetype"
  depends_on "jpeg"
  depends_on "python@3.9"

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/ce/ef/e793f6ffe245c960c42492d0bb50f8d14e2ba223f1922a5c3c81569cec44/Pillow-7.1.2.tar.gz"
    sha256 "a0b49960110bc6ff5fead46013bcb8825d101026d466f3a4de3476defe0fb0dd"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz"
    sha256 "ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz"
    sha256 "29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b"
  end

  def install
    venv = virtualenv_create(libexec, "python3")

    # copy/paster from core formula weboob
    resource("Pillow").stage do
      inreplace "setup.py" do |s|
        sdkprefix = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
        s.gsub! "openjpeg.h", "probably_not_a_header_called_this_eh.h"
        s.gsub! "xcb.h", "probably_not_a_header_called_this_eh.h"
        s.gsub! "ZLIB_ROOT = None",
          "ZLIB_ROOT = ('#{sdkprefix}/usr/lib', '#{sdkprefix}/usr/include')"
        s.gsub! "JPEG_ROOT = None",
          "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', '#{Formula["jpeg"].opt_prefix}/include')"
        s.gsub! "FREETYPE_ROOT = None",
          "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', " \
          "'#{Formula["freetype"].opt_prefix}/include')"
      end
      unless MacOS::CLT.installed?
        ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers"
      end
      venv.pip_install Pathname.pwd
    end

    (resources.map(&:name).to_set - ["Pillow"]).each do |r|
      venv.pip_install resource(r)
    end

    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"glue", "--help"
  end
end
